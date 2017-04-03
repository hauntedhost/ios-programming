//
//  Tree.swift
//  Tree
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

// tree class implementation (structs cannot be self-referential)
public final class Tree<T: Equatable> {
  var value: T
  var left: Tree?
  var right: Tree?
  
  init(value: T, left: Tree? = nil, right: Tree? = nil) {
    self.value = value
    self.left = left
    self.right = right
  }
}

// tree helpers
private func tail <T: Equatable>(_ trees: [Tree<T>]) -> [Tree<T>] {
  return Array(trees.dropFirst())
}

private func maybeAppend <T: Equatable>(_ trees: [Tree<T>], _ tree: Tree<T>?) -> [Tree<T>] {
  if let tree = tree {
    return trees + [tree]
  } else {
    return trees
  }
}

// manually curried maybeAppend for use in pipeline
private func maybeAppend <T: Equatable>(_ tree: Tree<T>?) -> ([Tree<T>]) -> [Tree<T>] {
  return { trees in return maybeAppend(trees, tree) }
}

// public breadth-first search
// delegates to private implementation
public func bfsContains<T: Equatable>(num: T, tree: Tree<T>) -> Bool {
  return bfsContains(num: num, trees: [tree])
}

// private bread-first search iterates through array
private func bfsContains <T: Equatable>(num: T, trees: [Tree<T>]) -> Bool {
  guard let first = trees.first else {
    print("not found")
    return false
  }
  
  print("handling node: \(first.value)")
  
  if first.value == num {
    print("found \(num)")
    return true
  } else {
    let rest =
      tail(trees)
        |> maybeAppend(first.left)
        |> maybeAppend(first.right)
    return bfsContains(num: num, trees: rest)
  }
}
