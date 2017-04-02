//
//  Town.swift
//  MonsterTown
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Town {
  var name: String
  var population = 5_422 {
    didSet(oldPopulation) {
      if oldPopulation > population {
        print("Oh no! \(name) lost \(oldPopulation - population) citizens")
      }
    }
  }
  var numberOfStopLights = 4
  
  enum Size {
    case small
    case medium
    case large
  }
  
//  // lazy property version of townSize
//  lazy var townSize: Size = {
//    switch self.population {
//    case 0...10_000:
//      return Size.small
//    case 10_001...100_000:
//      return Size.medium
//    default:
//      return Size.large
//    }
//  }()

  // computed property
  var townSize: Size {
    get {
      switch self.population {
      case 0...10_000:
        return Size.small
      case 10_001...100_000:
        return Size.medium
      default:
        return Size.large
      }
    }
  }

  init(name: String) {
    self.name = name
  }
  
  mutating func changePopulation(by amount: Int) {
    population += amount
  }
  
  func printDescription() {
    print([
      "\(asheville.name) is a \(townSize) sized town",
      "with a population of \(asheville.population)",
      "and \(asheville.numberOfStopLights) stoplights"
    ].joined(separator: " "))
  }
}
