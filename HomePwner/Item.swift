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
  var valueInDollars: Int
  var serialNumber: String?
  let dateCreated: Date

  init(name: String, serialNumber: String?, valueInDollars: Int) {
    self.name = name
    self.valueInDollars = valueInDollars
    self.serialNumber = serialNumber
    self.dateCreated = Date()

    super.init()
  }

  convenience init(random: Bool = false) {
    if random {
      let randomAdjective = Helpers.getRandomValue([
        "Sick",
        "Tragic",
        "Doom",
        "Delicious",
        "Fire 🔥",
        "Goth",
        "Psychedelic",
        "Dank",
      ])!

      let randomThingName = Helpers.getRandomValue([
        "Dagger",
        "Microcomputer",
        "Espresso",
        "Album",
        "Mango",
        "Curry",
        "Whiskey",
        "Kitten",
        "Mushroom 🍄",
        "Lazer",
        "Doggo",
      ])!

      let randomName = "\(randomAdjective) \(randomThingName)"

      let randomSerial =
        UUID()
          .uuidString
          .components(separatedBy: "-")
          .first

      let randomDollars = Helpers.random(max: 900)

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

