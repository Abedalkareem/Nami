//
//  Stack.swift
//  Nami
//
//  Created by abedalkareem omreyh on 02/05/2020.
//  Copyright © 2020 abedalkareem omreyh. All rights reserved.
//

import Foundation

struct Stack<I> {
  
  // MARK: - Properties
  
  var count: Int {
    array.count
  }
  var isEmpty: Bool {
    array.isEmpty
  }
  var peek: I? {
    return array.last
  }
  
  // MARK: private properties
  
  private var array = [I]()
  
  // MARK: - init
  
  init(_ items: [I] = []) {
    array = items
  }
  
  // MARK: - Public methods
  
  mutating func push(_ item: I) {
    array.append(item)
  }
  
  @discardableResult
  mutating func pop() -> I? {
    array.removeLast()
  }
  
  func last() -> I? {
    array.last
  }
  
}
