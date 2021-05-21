//
//  System.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation

protocol SystemProtocol {
    func operation()
}

class SystemA: SystemProtocol {
    func operation() {
        print("System A")
    }
    
    func freeze() {
        print("Freeze A")
    }
    
    func jump(positionL: Int64) {
        print("jump A")
    }
    
    func execute() {
        print("execute A")
    }
    
}

class SystemB: SystemProtocol {
    func operation() {
        print("System B")
    }

    func load(position: Int64, data: NSData) {}
}

class SystemC: SystemProtocol {
    func operation() {
        print("System C")
    }

    func read(postion: Int64, data: NSData) {}
}
