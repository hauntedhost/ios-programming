//
//  main.swift
//  MonsterTown
//
//  Created by sean on 4/2/17.
//  Copyright © 2017 sean. All rights reserved.
//

import Foundation

var asheville = Town(name: "Asheville")
asheville.printDescription()
asheville.changePopulation(by: -313)
asheville.printDescription()

let nosferatu = Monster(name: "nosferatu")
nosferatu.terrorizeTown()
nosferatu.town = asheville
nosferatu.terrorizeTown()
nosferatu.town?.printDescription()

let fred = Zombie(name: "fredzo")
fred.town = asheville
fred.terrorizeTown()
fred.terrorizeTown()
fred.terrorizeTown()


