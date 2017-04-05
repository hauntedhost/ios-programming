//
//  ItemStore.swift
//  HomePwner
//
//  Created by sean on 4/4/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ItemStore {
  var allItems = [Item]()

  init() {
    for _ in 0..<3 {
      createItem()
    }
  }

  @discardableResult func createItem() -> Item {
    let newItem = Item(random: true)
    allItems.append(newItem)
    return newItem
  }

  func removeItem(_ item: Item) {
    if let index = allItems.index(of: item) {
      allItems.remove(at: index)
    }
  }

  func moveItem(from fromIndex: Int, to toIndex: Int) {
    guard fromIndex != toIndex else {
      return
    }

    let movedItem = allItems[fromIndex]
    allItems.remove(at: fromIndex)
    allItems.insert(movedItem, at: toIndex)
  }
}
