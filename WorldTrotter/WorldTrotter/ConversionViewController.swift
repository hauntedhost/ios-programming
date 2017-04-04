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
    if let text = textField.text, let value = Double(text) {
      fahrenheightValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      fahrenheightValue = nil
    }
  }

  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    fahrenheightTextField.resignFirstResponder()
  }

  var fahrenheightValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelciusLabel()
    }
  }

  var celciusValue: Measurement<UnitTemperature>? {
    if let fahrenheightValue = fahrenheightValue {
      return fahrenheightValue.converted(to: .celsius)
    } else {
      return nil
    }
  }

  let blankCelciusLabelText = "Degrees °C"

  let numberFormatter: NumberFormatter = {
    let nf = NumberFormatter()
    nf.numberStyle = .decimal
    nf.minimumFractionDigits = 0
    nf.maximumFractionDigits = 1
    return nf
  }()

  func formattedLabel(_ measurement: Measurement<UnitTemperature>) -> String? {
    return numberFormatter.string(from: NSNumber(value: measurement.value))
  }

  func updateCelciusLabel() {
    if let celcius = celciusValue, let labelText = formattedLabel(celcius) {
      celciusLabel.text = labelText
    } else {
      celciusLabel.text = blankCelciusLabelText
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateCelciusLabel()
  }
}
