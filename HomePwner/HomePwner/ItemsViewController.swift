//
//  ItemsViewController.swift
//  HomePwner
//
//  Created by sean on 4/4/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {

  var itemStore: ItemStore!

  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return itemStore.allItems.count
  }

  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = UITableViewCell(
      style: .value1,
      reuseIdentifier: "UITableViewCell")

    let item = itemStore.allItems[indexPath.row]

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = "$\(item.valueInDollars)"

    return cell
  }
}
