//
//  Pipeline.swift
//  Tree
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

// generic pipeline operator ftw
infix operator |> : MultiplicationPrecedence

public func |> <Input, Output> (left: Input, right: (Input) -> Output) -> Output {
  return right(left)
}
