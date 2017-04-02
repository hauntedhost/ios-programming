//
//  Monster.swift
//  MonsterTown
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

open class Monster {
  static let isScary = true
  class var spookyNoise: String {
    return "Grrrrr"
  }

  var name: String
  var town: Town?
  var strength: Double
  var numAttacks: Int = 0

  init(name: String, town: Town?, strength: Double = 111) {
    self.name = name
    self.town = town
    self.strength = strength
    print("\(name) monster is alive!")
  }

  convenience init(name: String) {
    self.init(name: name, town: nil)
  }

  deinit {
    print("\(name) monster has disintegrated")
  }

  func terrorizeTown() {
    if var town = town {
      print("\(name) is terrorizing \(town.name)")
      let killCount = -Int(strength / 1.5)
      town.changePopulation(by: killCount)
      numAttacks += 1
    } else {
      print("\(name) has not found a town to terrorize yet")
    }
  }
}
