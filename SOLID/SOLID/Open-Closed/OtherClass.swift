//
//  OtherClass.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol OtherDelegate {
    func other(message: String)
}

class OtherViewController: OtherDelegate {
    func other(message: String) {
        print(message)
    }
}
