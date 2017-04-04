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

  func isNotSecondPeriod(
    textField: UITextField,
    replacementString: String?
  ) -> Bool {
    if hasPeriod(textField.text) && hasPeriod(replacementString) {
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

  // delegate callback to validate input text
  func textField(
    _ textField: UITextField,
    shouldChangeCharactersIn range: NSRange,
    replacementString string: String
  ) -> Bool {
    return
      isNumeric(string) &&
      isNotSecondPeriod(textField: textField, replacementString: string)
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
