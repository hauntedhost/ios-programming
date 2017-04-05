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
    let cell =
      tableView.dequeueReusableCell(
        withIdentifier: "UITableViewCell",
        for: indexPath)
    let item = itemStore.allItems[indexPath.row]

    cell.textLabel?.text = item.name
    cell.detailTextLabel?.text = "$\(item.valueInDollars)"

    return cell
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // position under status bar
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    let insets =
      UIEdgeInsets(
        top: statusBarHeight,
        left: 0,
        bottom: 0,
        right: 0)
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
  }
}
