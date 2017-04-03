//
//  main.swift
//  Tree
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

//          5
//         / \
//        10  30
//       / \
//     13   22
let intTree = Tree(
  value: 5,
  left: Tree(
    value: 10,
    left: Tree(value: 13),
    right: Tree(value: 22)
  ),
  right: Tree(value: 30)
)

let findNum = 30
let didFindNum = bfsContains(num: findNum, tree: intTree)
print("number \(findNum) found? \(didFindNum)")

//           "foo"
//           /   \
//        "bar"  "baz"
//        /   \
//     "qux"  "pax"
let stringTree = Tree(
  value: "foo",
  left: Tree(
    value: "bar",
    left: Tree(value: "qux"),
    right: Tree(value: "pax")
  ),
  right: Tree(value: "baz")
)

let findString = "pax"
let didFindString = bfsContains(num: findString, tree: stringTree)
print("string \(findString) found? \(didFindString)")

