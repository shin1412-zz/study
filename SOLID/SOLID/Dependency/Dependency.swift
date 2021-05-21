//
//  Dependency.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import Foundation

protocol DataBase {
    func saveData()
}

class CorreDataController: DataBase {
    func saveData() {
       print("Message")
    }
}
