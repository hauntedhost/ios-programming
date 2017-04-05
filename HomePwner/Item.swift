//
//  Item.swift
//  HomePwner
//
//  Created by sean on 4/4/17.
//  Copyright © 2017 sean. All rights reserved.
//

import UIKit

class Item: NSObject {
  var name: String
  var valueInDollars: Double
  var serialNumber: String?
  let dateCreated: Date

  init(name: String, serialNumber: String?, valueInDollars: Double) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.serialNumber = serialNumber
    self.dateCreated = Date()

    super.init()
  }

  convenience init(random: Bool = false) {
    if random {
      let randomAdjective = Helpers.getRandomValue([
        "🔥",
        "🍄",
        "Sick",
        "Tragic",
        "Metal",
        "Doomulus",
        "Delicious",
        "Habanero",
        "Goth",
        "Strange",
        "Dank",
        "Normcore",
        "Heavy",
      ])!

      let randomThingName = Helpers.getRandomValue([
        "Dagger",
        "Microcomputer",
        "Espresso",
        "Album",
        "Jalapeno",
        "Hot Sauce",
        "Mango",
        "La Croix",
        "Cast Iron",
        "Curry",
        "Whiskey",
        "Kitten",
        "Lazer",
        "Doggo",
      ])!

      let randomName = "\(randomAdjective) \(randomThingName)"

      let randomSerial =
        UUID()
          .uuidString
          .components(separatedBy: "-")
          .first

      let randomDollars = Double(Helpers.random(max: 900))

      self.init(
        name: randomName,
        serialNumber: randomSerial,
        valueInDollars: randomDollars
      )
    } else {
      self.init(name: "", serialNumber: nil, valueInDollars: 0)
    }
  }
}

