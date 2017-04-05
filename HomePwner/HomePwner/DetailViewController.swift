//
//  DetailViewController.swift
//  HomePwner
//
//  Created by sean on 4/5/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

  @IBOutlet var nameField: UITextField!
  @IBOutlet var serialNumberField: UITextField!
  @IBOutlet var valueField: UITextField!
  @IBOutlet var dateLabel: UILabel!

  var item: Item!

  func updateItemFromFields() {
    item.name = nameField.text ?? ""
    item.serialNumber = serialNumberField.text

    if let valueText = valueField.text,
       let value = Double(valueText) {
      item.valueInDollars = value
    } else {
      item.valueInDollars = 0
    }
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    updateItemFromFields()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    nameField.text = item.name
    serialNumberField.text = item.serialNumber

    valueField.text = Helpers.numberFormatter.string(
      from: NSNumber(value: item.valueInDollars)
    )
    dateLabel.text = Helpers.dateFormatter.string(from: item.dateCreated)
  }
}
