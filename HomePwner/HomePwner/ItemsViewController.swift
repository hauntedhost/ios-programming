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

  @IBAction func addNewItem(_ sender: UIButton) {
    let newItem = itemStore.createItem()
    if let index = itemStore.allItems.index(of: newItem) {
      let indexPath = IndexPath(row: index, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    }
  }

  @IBAction func toggleEditingMode(_ sender: UIButton) {
    if isEditing {
      sender.setTitle("Edit", for: .normal)
      setEditing(false, animated: true)
    } else {
      sender.setTitle("Done", for: .normal)
      setEditing(true, animated: true)
    }
  }

  // required handler for number of rows
  override func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    return itemStore.allItems.count
  }

  // required handler for getting specific cell
  override func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "ItemCell",
      for: indexPath
    ) as! ItemCell
    let item = itemStore.allItems[indexPath.row]

    cell.nameLabel.text = item.name
    cell.serialNumberLabel.text = item.serialNumber
    cell.valueLabel.text = "$\(item.valueInDollars)"

    return cell
  }

  // handler for commiting (ie. deleting) a change
  override func tableView(
    _ tableView: UITableView,
    commit editingStyle: UITableViewCellEditingStyle,
    forRowAt indexPath: IndexPath
  ) {
    if editingStyle == .delete {
      let item = itemStore.allItems[indexPath.row]

      // delete action confirmation
      let alertController = UIAlertController(
        title: "Delete \(item.name)?",
        message: "Are you sure you want to delete this item?",
        preferredStyle: .actionSheet
      )

      let cancelAction = UIAlertAction(
        title: "Cancel",
        style: .cancel,
        handler: nil
      )

      let deleteAction = UIAlertAction(
        title: "Delete",
        style: .destructive,
        handler: { action -> Void in
          self.itemStore.removeItem(item)
          self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
      )

      alertController.addAction(cancelAction)
      alertController.addAction(deleteAction)
      present(alertController, animated:  true, completion: nil)
    }
  }

  // handler for moved item
  override func tableView(
    _ tableView: UITableView,
    moveRowAt sourceIndexPath: IndexPath,
    to destinationIndexPath: IndexPath
  ) {
    itemStore.moveItem(
      from: sourceIndexPath.row,
      to: destinationIndexPath.row
    )
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    switch segue.identifier {
    case "showItem"?:
      if let row = tableView.indexPathForSelectedRow?.row {
        let item = itemStore.allItems[row]
        let detailViewController =
          segue.destination as! DetailViewController
        detailViewController.item = item
      }
    default:
      preconditionFailure("Unexpected segue identifier")
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // position under status bar
    let statusBarHeight = UIApplication.shared.statusBarFrame.height
    let insets = UIEdgeInsets(
      top: statusBarHeight,
      left: 0,
      bottom: 0,
      right: 0
    )
    tableView.contentInset = insets
    tableView.scrollIndicatorInsets = insets
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 65
  }
}

