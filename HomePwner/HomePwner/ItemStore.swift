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
    for _ in 0..<60 {
      createItem()
    }
  }

  @discardableResult func createItem() -> Item {
    let newItem = Item(random: true)
    allItems.append(newItem)
    return newItem
  }
}
