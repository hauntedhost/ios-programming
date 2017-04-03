//
//  main.swift
//  Generics
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

func makeIntPair(_ x: Int, _ y: Int) -> (Int, Int) {
  return (x, y)
}

func makeStringPair(_ x: String, _ y: String) -> (String, String) {
  return (x, y)
}

func makePair<T>(_ x: T, _ y: T) -> (T, T) {
  return (x, y)
}

func makePair<A, B>(_ x: A, _ y: B) -> (A, B) {
  return (x, y)
}

func isEqual<T: Equatable>(_ x: T, _ y: T) -> Bool {
  return x == y
}

func makeIntArray<T: IteratorProtocol>(iterator: T) -> [Int] where T.Element == Int {
  var iterator = iterator
  var results = [Int]()

  while let item = iterator.next() {
    results.append(item)
  }

  return results
}

//let things = ["foo", 5, "bar", "baz"].makeIterator()
let things = [5, 9, 12].makeIterator()
let result = makeIntArray(iterator: things)
print("things: \(things)")
print("result: \(result)")

var intStack = Stack<Int>([2, 3, 4])
var stringStack = Stack(["foo", "bar", "baz"])
print("intStack: \(intStack)")
print("stringStack: \(stringStack)")

public func myMap<T, U>(_ items: [T], _ f: (T) -> (U)) -> [U] {
  var result = [U]()
  for item in items {
    result.append(f(item))
  }
  return result
}

let squares = myMap([2, 3, 4], { $0 * $0 })
print("squares: \(squares)")

let screaming = myMap(["foo", "bar", "baz"], { $0.uppercased() })
print("screaming: \(screaming)")

let stringIntsDup = intStack.map { String($0) + String($0) }
print("stringIntsDup: \(stringIntsDup)")

let doubles = intStack.map { $0 * 2 }
print("doubles: \(doubles)")

for n in intStack {
  print("n: \(n)")
}
print("intStack: \(intStack)")

var otherStringStack = Stack(["buz", "pax", "faq"])
stringStack.pushAll(otherStringStack)
print("stringStack: \(stringStack)")

let intStack2 = Stack<Int>([1, 2, 3, 4, 5, 6, 7, 8])
let evens = intStack2.filter { $0 % 2 == 0 }
print("evens: \(evens)")
