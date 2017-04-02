//
//  main.swift
//  Mythology
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

// VALUE TYPES
// ===========

var greeting = "hello world"
var otherGreeting = greeting
otherGreeting += "!!"
print("otherGreeting: \(otherGreeting)")
print("greeting: \(greeting)")

// even though MutableStruct is mutable, name cannot be reassigned
// because immutableMutableStruct is a let constant
let immutableMutableStruct = MutableStruct(name: "sean")
//immutableMutableStruct.name = "castle"

// to allow MutableStruct properties to be reassigned
// mutableMutableStruct must be assigned to a var
var mutableMutableStruct = MutableStruct(name: "sean")
mutableMutableStruct.name = "castle"

// ImmutableStruct was assigned to let constant
// _and_ has let constant properties
// this thing is not changing dawg
let immutableImmutableStruct = ImmutableStruct(name: "sean")
//immutableImmutableStruct.name = "castle"

// ImmutableStruct has let constant properties
// so they simply can never be reassigned even when assigned to a var
// the only thing possible is to change reference for mutableImmutableStruct
var mutableImmutableStruct: ImmutableStruct? = ImmutableStruct(name: "sean")
//mutableImmutableStruct?.name = "castle"
mutableImmutableStruct = nil

// TL;DR:
// value types declared as constants cannot have their properties changed
// even if the properties are declared with var in the type's implementation

// REFERENCE TYPES
// ===============

let hecate = GreekGod(name: "Hecate")
let otherHecate = hecate
otherHecate.name = "Hecate II"
print("otherHecate.name \(otherHecate.name)")
print("hecate.name \(hecate.name)")

// MIXED REFERENCE/VALUE TYPES
// ===========================

let zeus = GreekGod(name: "Zeus")
let pantheon = Pantheon(chiefGod: zeus)
zeus.name = "Evil Zeus"
print("pantheon.chiefGod: \(pantheon.chiefGod.name)")

// TL;DR:
// AVOID using reference types in value types
// a property in a value type can point to a reference type
// and retains that reference (i.e. does not get a copy of that reference)
// even though it, itself, is copied

let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]
let otherGods = gods

print("hecate === otherHecate? \(hecate === otherHecate)")
//print("gods == otherGods? \(gods === otherGods)")


