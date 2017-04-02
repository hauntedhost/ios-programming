//
//  main.swift
//  Swifting
//
//  Created by sean on 4/1/17.
//
//

import Foundation

// repl does not allow this
let a: Int
a = 5

var maybeName: String? = nil
if let name = maybeName {
  print(name)
}

let name = maybeName ?? "hello"

//let maybeNameIndex = maybeName?.endIndex
if let index = maybeName?.endIndex {
  print(index)
}

maybeName = "castle"
if let name = maybeName {
  print(name)
}

// implicitly unwrapped optionals wtf
let thing: Int!
thing = 3 // if we set this to nil, print will blow up at runtime
print(thing)

var fruits: [String] = ["orange", "mango", "banana"]
let deletedFruit = fruits.remove(at: 1)

var movieRatings: [String:Double] = [
  "Evil Dead": 4.5,
]

let maybeRating = movieRatings["Evil Dead"]

if let rating = movieRatings["Evil Dead"] {
  print(rating)
}

let newRating = 4.9
if let oldRating = movieRatings.updateValue(newRating, forKey: "Evil Dead") {
  print("old rating: \(oldRating), new rating is \(newRating)")
}

let movieName = "Evil Dead"
if let deletedRating = movieRatings.removeValue(forKey: movieName) {
  print("deleted the movie \(movieName) that had rating \(deletedRating)")
}

// sets
let set1: Set<Int> = [1, 2, 3]
let set2: Set = [1, 2, 3]
let set3 = Set<Int>([1, 2, 3])

// functions
func sayHello(to name: String = "nobody") {
  print("hello there \(name)")
}
sayHello()
sayHello(to: "sean")

// mutating parameters with inout
var myName = "sean"
func upcase(_ string: inout String) {
  string = string.uppercased()
}
upcase(&myName)
print(myName)

// returning values
func uppercased(_ string: String) -> String {
  return string.uppercased()
}
print(uppercased(myName))

// variadic function
func join(_ words: String..., with separator: String = "") -> String {
  return words.joined(separator: separator)
}

let smashed = join("foo", "bar", "baz")
print(smashed)

let csv = join("hello", "there", "world", with: ",")
print(csv)

// guards
func welcomeToTheClub(age: Int) {
  guard age >= 21 else {
    print("welcome, need put an x on your hand")
    return
  }
  print("welcome, here is your wrist band")
}

func bouncer(age: Int) -> Bool {
  guard age >= 21 else {
    return false
  }
  return true
}

// closures
let numbers = [5, -9, 13, 500]

let numbersAsc1 = numbers.sorted(by: { $0 < $1 })

let numbersAsc2 = numbers.sorted { $0 < $1 }

let numbersAsc3 = numbers.sorted {
  (a, b) -> Bool in return a < b
}

let numbersAsc4 = numbers.sorted(by: <)

// nope
//let numbersAsc4b = numbers.sorted (<)

// anonymous functions
let sorter = { (a: Int, b: Int) -> Bool in return a < b }
let numbersAsc5 = numbers.sorted(by: sorter)
print(numbersAsc5)

// function overloading
func handleThing(_ a: String) -> String {
  return "got a string!"
}

func handleThing(_ a: Int) -> String {
  return "got an int!"
}

// NOPE: can't pattern match on raw value
//func handleThing(_ 5: Int) -> String {
//  return "this handles the number 5 specifically"
//}

print(handleThing(1))
print(handleThing("hellooo"))

// operator functions
prefix operator √
prefix func √ (_ num: Double) -> Double {
  return sqrt(num)
}
print(√(3))

// higher order closures
let makeAdder = { (_ a: Int) -> (Int) -> Int in
  return {
    (_ b: Int) -> Int in return a + b
  }
}
let addFive = makeAdder(5)
print(addFive(10))

func makeAdder2(a: Int) -> (Int) -> Int {
  func adder(b: Int) -> Int {
    return a + b
  }
  return adder
}
let addTen = makeAdder(10)
print(addTen(100))

func filter(_ list: [Int], by: (Int) -> Bool) -> [Int] {
  var result: [Int] = []
  for num in list {
    if by(num) {
      result.append(num)
    }
  }
  return result
}
let evens = filter([12, 1, 10, 3, -9, 2, 100, 5, 6], by: { $0 % 2 == 0 })
let evens2 = filter([12, 1, 10, 3, -9, 2, 100, 5, 6]) { $0 % 2 == 0 }

enum Monster: String {
  case squid
  case vampire
  case zombie
}
var fred = Monster.vampire
fred = .squid

switch fred {
case .squid:
  print("sqshhh")
case .zombie:
  print("braaaaaains!")
case .vampire:
  print("bleh!")
}

// initialize an enum via a rawValue
// returns an optional
let maybeNosferatu = Monster(rawValue: "vampire")
if let nosferatu = maybeNosferatu {
  print(nosferatu.rawValue)
}

enum WebServiceResult {
  case success(String)
  case error(Int)
}

let errorResult = WebServiceResult.error(400)
switch errorResult {
case let .success(message):
  print("success! \(message)")
case let .error(code):
  print("error: \(code)")
}

let mapC = { (list: [Int], by: (Int) -> Int) -> [Int] in
  var result: [Int] = []
  for n in list {
    result.append(by(n))
  }
  return result
}
let squares = mapC([2, 3, 4], { $0 * $0 })
print(squares)

func mapF(_ list: [Int], by: (Int) -> Int) -> [Int] {
  var result: [Int] = []
  for n in list {
    result.append(by(n))
  }
  return result
}
let doubles = mapF([2, 3, 4], by: { $0 * $0 })
print(doubles)

// recursive enum
enum BinaryTree {
  case none(value: Int)
  indirect case left(value: Int, left: BinaryTree)
  indirect case right(value: Int, right: BinaryTree)
  indirect case both(
    value: Int,
    left: BinaryTree,
    right: BinaryTree
  )
}

//          5
//         / \
//        10  30
//       / \
//     13   22
let tree = BinaryTree.both(
  value: 5,
  left: .both(
    value: 10,
    left: .none(value: 13),
    right: .none(value: 22)
  ),
  right: .none(value: 30)
)

// structs
struct Body {
  var heightInMeters: Double? = 0
  var weightInKilos: Double? = 0
}

class Person {
  
}

class Tree {
  var value: Int
  var left: Tree?
  var right: Tree?
  
  init(value: Int, left: Tree? = nil, right: Tree? = nil) {
    self.value = value
    self.left = left
    self.right = right
  }
}

//          5
//         / \
//        10  30
//       / \
//     13   22
let treeC = Tree(
  value: 5,
  left: Tree(
    value: 10,
    left: Tree(value: 13),
    right: Tree(value: 22)
  ),
  right: Tree(value: 30)
)

func treeTail(_ trees: [Tree]) -> [Tree] {
  return Array(trees.dropFirst())
}

func bfsContains(num: Int, tree: Tree) -> Bool {
  return bfsContains(num: num, trees: [tree])
}

func bfsContains(num: Int, trees: [Tree]) -> Bool {
  if let first = trees.first {
    print("handling node: \(first.value)")

    guard first.value != num else {
      print("found \(num)")
      return true
    }

    var rest = treeTail(trees)
    if let left = first.left   { rest.append(left)  }
    if let right = first.right { rest.append(right) }
    return bfsContains(num: num, trees: rest)
  } else {
    print("not found")
    return false
  }
}

let findNum = 10
let foundNum = bfsContains(num: findNum, tree: treeC)
print("number \(findNum) found? \(foundNum)")
