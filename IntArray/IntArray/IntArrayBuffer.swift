//
//  IntArrayBuffer.swift
//  IntArray
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

class IntArrayBuffer {
  var storage: [Int]

  init() {
    storage = []
  }
  
  init(buffer: IntArrayBuffer) {
    storage = buffer.storage
  }
}
