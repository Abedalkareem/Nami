//
//  Navigator.swift
//  Nami
//
//  Created by abedalkareem omreyh on 01/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import SwiftUI

public typealias NavigatorAnimation = ((UIView) -> Void)

fileprivate var stack = Stack<AppStack>()

// MARK: Public

/// To be used in `AppDelegate` to set the first root view controller.
/// - Parameter views: Array of views to add to the stack. the last view will be shown
/// on the screen.
/// So you can set one view or build a stack of views like
/// ```
/// initRoot(with: MainScreen(), UserProfile(), NotificationsScreen())
/// ```
/// - Returns: Returns the view added to the stack.
public func initRoot(with views: AnyView...) -> AnyView {
  let views = views.map { ViewWrapper(view: AnyView($0)) }
  let subStack = AppStack(views: views)
  stack.push(subStack)
  return AnyView(subStack)
} 

/// Replace the current root with new root and remove all the previews views.
/// - Parameters:
///   - view: A view to show.
///   - animation: An animation to show while changing the root.
public func replaceRoot<T: View>(with view: T, animation: NavigatorAnimation? = nil) {
  let subStack = AppStack(views: [ViewWrapper(view: AnyView(view))])
  stack = Stack([subStack])
  changeViewController(for: UIApplication.keyWindow,
                        rootViewController: UIHostingController(rootView: subStack),
                        animation: animation)
}

/// Push a new view to the top stack.
/// - Parameter view: View to show.
public func push<T: View>(with view: T) {
  var subStack = stack.pop()
  if subStack == nil {
    subStack = AppStack(views: [ViewWrapper(view: AnyView(view))])
  } else {
    subStack?.push(ViewWrapper(view: AnyView(view)))
  }
  stack.push(subStack!)
}

/// Present a new stack with view on the top of the views. you can then push new
/// views using `push(with:)` to push new views.
/// - Parameters:
///   - view: A view to present.
///   - animation: An animation to show while changing the presenting.
public func present<T: View>(with view: T, animation: NavigatorAnimation? = nil) {
  let subStack = AppStack(views: [ViewWrapper(view: AnyView(view))])
  stack.push(subStack)
  setRoot(with: subStack, animation: animation)
}

/// Pop a view from the top of the top stack.
public func pop() {
  let subStack = stack.pop()
  if (subStack?.count ?? 0) > 1 {
    subStack?.pop()
  }
  stack.push(subStack!)
}

/// Dismiss the top stack.
/// - Parameter animation: An animation to show while changing the dismissing.
public func dismiss(with animation: NavigatorAnimation? = nil) {
  guard stack.count > 1 else {
    return
  }
  stack.pop()
  setRoot(with: stack.peek, animation: animation)
}

// MARK: Fileprivate

fileprivate func setRoot<T: View>(with view: T, animation: NavigatorAnimation? = nil) {
  changeViewController(for: UIApplication.keyWindow,
                       rootViewController: UIHostingController(rootView: view),
                       animation: animation)
}

fileprivate func changeViewController(for window: UIWindow?,
                                      rootViewController: UIViewController,
                                      animation: NavigatorAnimation? = nil) {
  guard let snapshot = window?.snapshotView(afterScreenUpdates: true) else {
    return
  }
  rootViewController.view.addSubview(snapshot);
  
  window?.rootViewController = rootViewController
  
  UIView.animate(withDuration: 0.5, animations: {
    animation?(snapshot)
  }) { _ in
    snapshot.removeFromSuperview()
  }
}
