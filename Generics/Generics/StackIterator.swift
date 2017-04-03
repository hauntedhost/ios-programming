//
//  StackIterator.swift
//  Generics
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

public struct StackIterator<T>: IteratorProtocol {
  var stack: Stack<T>
  
  mutating public func next() -> T? {
    return stack.pop()
  }
}
