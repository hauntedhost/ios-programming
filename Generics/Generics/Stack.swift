//
//  Stack.swift
//  Generics
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

public struct Stack<Element>: Sequence {
  var items: [Element]
  
  init(_ items: [Element] = []) {
    self.items = items
  }

  public func makeIterator() -> StackIterator<Element> {
    return StackIterator(stack: self)
  }

  mutating public func push(_ newItem: Element) {
    items.append(newItem)
  }
  
  mutating public func pushAll<S: Sequence>(_ sequence: S)
  where S.Iterator.Element == Element {
    for item in sequence {
      self.push(item)
    }
  }
  
  mutating public func pop() -> Element? {
    guard !items.isEmpty else {
      return nil
    }
    return items.removeLast()
  }
  
  public func filter(_ f: (Element) -> Bool) -> Stack<Element> {
    var filteredItems = [Element]()
    for item in items {
      if f(item) {
        filteredItems.append(item)
      }
    }
    return Stack<Element>(filteredItems)
  }

  public func map<U>(_ f: (Element) -> U) -> Stack<U> {
    var mappedItems = [U]()
    for item in items {
      mappedItems.append(f(item))
    }
    return Stack<U>(mappedItems)
  }
}
