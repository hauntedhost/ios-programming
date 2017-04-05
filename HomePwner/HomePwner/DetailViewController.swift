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
    if let nameText = nameField.text,
           nameText != item.name {
      item.name = nameText
    }

    if let serialNumberText = serialNumberField.text,
           serialNumberText != item.serialNumber {
      item.serialNumber = serialNumberText
    }

    if let valueText = valueField.text,
       let value = Double(valueText),
           value != item.valueInDollars {
      item.valueInDollars = value
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
