//
//  UIApplication+Helpers.swift
//  Nami
//
//  Created by abedalkareem omreyh on 02/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import UIKit

extension UIApplication {
  static var keyWindow: UIWindow? {
    return UIApplication.shared.connectedScenes
      .filter({$0.activationState == .foregroundActive})
      .map({$0 as? UIWindowScene})
      .compactMap({$0})
      .first?.windows
      .filter({$0.isKeyWindow}).first
  }
}
