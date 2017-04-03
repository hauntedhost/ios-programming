//
//  main.swift
//  Pipeline
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

infix operator |> : MultiplicationPrecedence

public func |> <Input, Output> (left: Input, right: (Input) -> Output) -> Output {
  return right(left)
}

func add(_ a: Int, _ b: Int) -> Int {
  return a + b
}

// manually curried add func
func add(_ a: Int) -> (Int) -> Int {
  return { b in return a + b }
}

let total =
  5
  |> add(6)
  |> add(10)
  |> add(12)

print("total: \(total)")

// TODO: versions of |> that takes a tuple, e.g.:
// - (fn, arg1)
// - (fn, arg1, arg2)
// - (fn, arg1, arg2, arg3)

//public func |> <Input, Output> (_ (left: (Input) -> Output), right: Input)) -> Output {
//  return right(left)
//}

//func thing(_ (_ a: Int, _ b: Int)) {
//  
//}
