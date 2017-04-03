//
//  Temperature.swift
//  WorldTrotter
//
//  Created by sean on 4/3/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Temperature {
  var degrees: Double? = nil
  var unit: Unit

  enum Unit: String {
    case celcius    = "°C"
    case fahrenheit = "°F"
  }
  
  func displayString() -> String {
    return "\(degrees) \(unit.rawValue)"
  }
  
  init(unit: Unit) {
    self.unit = unit
  }
}
