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
      maybeFahrenheightValue = Measurement(value: value, unit: .fahrenheit)
    } else {
      maybeFahrenheightValue = nil
    }
  }

  @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
    fahrenheightTextField.resignFirstResponder()
  }

  var maybeFahrenheightValue: Measurement<UnitTemperature>? {
    didSet {
      updateCelciusLabel()
    }
  }

  var celciusValue: Measurement<UnitTemperature>? {
    if let fahrenheightValue = maybeFahrenheightValue {
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

  func hasPeriod(_ maybeString: String?) -> Bool {
    if let string = maybeString {
      return string.range(of: ".") != nil
    } else {
      return false
    }
  }

  func doesNotAddSecondDecimalMark(
    _ maybeCurrentText: String?,
    _ newText: String
  ) -> Bool {
    return [maybeCurrentText, newText].filter { hasPeriod($0) }.count <= 1
  }

  func doesNotAddThirdDecimalPlace(
    _ maybeCurrentText: String?,
    _ newText: String
    ) -> Bool {
    if let currentText = maybeCurrentText, hasPeriod(currentText) {
      let leftRight = currentText.components(separatedBy: ".")
      return (leftRight[1] + newText).characters.count <= 2
    } else {
      return true
    }
  }

  // need to test that string is decimal or period
  let numericCharacterSet = CharacterSet(charactersIn: "0123456789.")

  func isNumeric(_ string: String) -> Bool {
    return string.rangeOfCharacter(from: numericCharacterSet.inverted) == nil
  }

  func doesNotInvalidateLength(
    _ maybeCurrentText: String?,
    _ newText: String
  ) -> Bool {
    // if new text is empty, might be delete key, let it pass
    guard !newText.isEmpty else {
      return true
    }

    if let currentText = maybeCurrentText {
      return currentText.characters.count < 12
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
      doesNotAddThirdDecimalPlace(textField.text, string) &&
      doesNotAddSecondDecimalMark(textField.text, string)
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
