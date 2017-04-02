//
//  main.swift
//  IntArray
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

var numbers = IntArray()
numbers.append(3)
numbers.append(5)

var otherNumbers = numbers
numbers.append(7)
numbers.append(9)

numbers.describe()
otherNumbers.describe()
