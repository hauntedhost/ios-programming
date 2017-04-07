//
//  JSON.swift
//  Photorama
//
//  Created by sean on 4/6/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct JSON {

  static func parse(_ data: Data?) -> Any? {
    guard let jsonData = data else {
      return nil
    }

    do {
      return try JSONSerialization.jsonObject(
        with: jsonData,
        options: []
      )
    } catch {
      return nil
    }
  }

  static func parseToString(_ data: Data?) -> String? {
    guard let jsonData = data else {
      return nil
    }

    return String(data: jsonData, encoding: .utf8)
  }
}
