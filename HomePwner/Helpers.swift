//
//  Helpers.swift
//  HomePwner
//
//  Created by sean on 4/4/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct Helpers {
  static func getRandomValue<T>(_ arr: [T]) -> T? {
    guard !arr.isEmpty else {
      return nil
    }

    let randomIndex = random(max: arr.count - 1)
    return arr[randomIndex]
  }

  static func random(max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)))
  }
}
