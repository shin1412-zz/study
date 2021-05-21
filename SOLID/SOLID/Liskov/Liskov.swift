//
//  Liskov.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol Vehicle {
    func move()
}

protocol Motor {
    func setTankCapacity()
}

class Car: Vehicle, Motor {
    func setTankCapacity() {
        print("Tank capacity: 100.0")
    }
    func move() {
        print("Car moved")
    }
}

class Bicycle: Vehicle {
    func move() {
        print("Bicycle moved")
    }
}
