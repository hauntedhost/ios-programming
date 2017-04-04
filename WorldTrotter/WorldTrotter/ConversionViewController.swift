//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
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

  func hasPeriod(_ string: String?) -> Bool {
    if let string = string {
      return string.range(of: ".") != nil
    } else {
      return false
    }
  }

  func isNotSecondPeriod(_ str1: String?, _ str2: String?) -> Bool {
    if hasPeriod(str1) && hasPeriod(str2) {
      return false
    } else {
      return true
    }
  }

  // need to test that string is decimal or period
  let numericCharacterSet = CharacterSet(charactersIn: "0123456789.")

  func isNumeric(_ string: String) -> Bool {
    return string.rangeOfCharacter(from: numericCharacterSet.inverted) == nil
  }

  func doesNotInvalidateLength(_ text: String?, _ string: String?) -> Bool {
    guard let string = string, !string.isEmpty else {
      return true
    }

    if let text = text {
      return text.characters.count < 12
    } else {
      return true
    }
  }

  // delegate callback to validate input text
  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    return
      isNumeric(string) &&
      doesNotInvalidateLength(textField.text, string) &&
      isNotSecondPeriod(textField.text, string)
  }

  func updateCelciusLabel() {
    if let celcius = celciusValue, let labelText = formattedLabel(celcius) {
      celciusLabel.text = labelText + "°C"
    } else {
      celciusLabel.text = "Degrees°C"
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    updateCelciusLabel()
  }
}
