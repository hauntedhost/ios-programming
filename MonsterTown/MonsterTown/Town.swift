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
  var region: String
  var population: Int {
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

  init?(name: String, population: Int) {
    self.init(name: name, population: population, region: "N/A")
  }

  init?(name: String, population: Int = 5_422, region: String) {
    guard population > 0 else {
      print("population must be at least one")
      return nil
    }

    self.name = name
    self.population = population
    self.region = region
  }
  
  mutating func changePopulation(by amount: Int) {
    population += amount
  }
  
  func printDescription() {
    print([
      "\(name) is a \(townSize) sized town",
      "with a population of \(population)",
      "and \(numberOfStopLights) stoplights"
    ].joined(separator: " "))
  }
}
