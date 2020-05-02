//
//  AppStack.swift
//  Nami
//
//  Created by abedalkareem omreyh on 02/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import SwiftUI

struct AppStack: View {
  
  @ObservedObject var viewModel: AppStackViewModel
  
  var count: Int {
    viewModel.views.count
  }
  
  init(views: [ViewWrapper]) {
    viewModel = AppStackViewModel(views: views)
  }
  
  func pop() {
    viewModel.pop()
  }
  
  func push(_ view: ViewWrapper) {
    viewModel.push(view)
  }
  
  var body: some View {
    ZStack {
      viewModel.view
        .id(viewModel.id)
        .animation(.easeOut)
    }
  }
}
