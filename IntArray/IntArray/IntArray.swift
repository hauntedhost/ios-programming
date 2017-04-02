//
//  IntArray.swift
//  IntArray
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

struct IntArray {
  private var buffer: IntArrayBuffer

  init() {
    buffer = IntArrayBuffer()
  }

  func describe() {
    print(buffer.storage)
  }

  mutating func append(_ value: Int) {
    copyIfNeeded()
    buffer.storage.append(value)
  }

  private mutating func copyIfNeeded() {
    if isKnownUniquelyReferenced(&buffer) {
      print("using existing reference")
    } else {
      print("making a copy")
      buffer = IntArrayBuffer(buffer: buffer)
    }
  }
}
