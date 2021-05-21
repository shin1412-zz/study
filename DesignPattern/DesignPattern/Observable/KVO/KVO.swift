//
//  KVO.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import Foundation

class KVO: NSObject {
    @objc dynamic var createAt = Date()
    @objc dynamic var updateAt = Date()
}
