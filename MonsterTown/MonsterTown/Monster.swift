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
  var strength: Double = 111
  var numAttacks: Int = 0
  
  init(name: String) {
    self.name = name
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
