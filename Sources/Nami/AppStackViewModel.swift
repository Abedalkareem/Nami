//
//  AppStackViewModel.swift
//  Nami
//
//  Created by abedalkareem omreyh on 02/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import SwiftUI

class AppStackViewModel: ObservableObject {
  @Published var views: Stack<ViewWrapper>
  
  var isPop = false
  
  var view: AnyView? {
    return views.peek?.view
  }
  
  var id: String? {
    return views.peek?.id
  }
  
  init(views: [ViewWrapper]) {
    self.views = Stack(views)
  }
  
  func push(_ view: ViewWrapper) {
    isPop = false
    withAnimation {
      views.push(view)
    }
  }
  
  func pop() {
    isPop = true
    withAnimation {
      _ = views.pop()
    }
  }
}
