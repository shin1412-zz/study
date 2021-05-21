//
//  Facade.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation

class Facade {
    
    // create system
    var systemA = SystemA()
    var systemB = SystemB()
    var systemC = SystemC()
    
    func wrapOperation() {
        systemA.operation()
        systemB.operation()
        systemC.operation()
    }

    func start() {
        systemA.freeze()
        systemB.load(position: Int64(BOOT_TIME), data: NSData())
        systemA.jump(positionL: Int64(BOOT_TIME))
        systemA.execute()
    }

    func end() {
        systemC.read(postion: Int64(BOOT_TIME), data: NSData())
    }
}
