//
//  Zombie.swift
//  MonsterTown
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

public class Zombie: Monster {
  override class var spookyNoise: String {
    return "Braaaains"
  }
  var walksWithLimp = true
  private(set) var isFallingApart = false
  override var numAttacks: Int {
    didSet {
      if numAttacks >= 3 {
        isFallingApart = true
      }
    }
  }

  override func terrorizeTown() {
    if !isFallingApart {
      super.terrorizeTown()
    } else {
      print("\(name) cannot terrorize because fallen the hell apart")
    }
  }
}
