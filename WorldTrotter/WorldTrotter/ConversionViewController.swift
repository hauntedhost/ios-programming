//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
  @IBOutlet var celciusLabel: UILabel!
  @IBOutlet var fahrenheightTextField: UITextField!

  @IBAction func fahrenheightFieldEditingChanged(_ textField: UITextField) {
    celciusLabel.text = textField.text
    refreshView()
  }

  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    fahrenheightTextField.resignFirstResponder()
  }

  let blankCelciusLabelText = "Degrees °C"

  private func refreshView() {
    if let fieldText = fahrenheightTextField.text, fieldText.isEmpty {
      celciusLabel.text = blankCelciusLabelText
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    refreshView()
  }
}

