//
//  StrategyData.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import Foundation

enum UserType: String {
    case friend = "FRIEND"
    case follower = "FOLLOEWER"
}
struct User: Codable {
    var name: String?
    var age: Int?
    var address: String?
    var type: String?
}

var data: [User] = [
    User(name: "Shin8", age: 8, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin9", age: 9, address: "Ha Noi", type: "FOLLOEWER"),
    User(name: "Shin10", age: 10, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin11", age: 11, address: "Ha Noi", type: "FOLLOEWER"),
    User(name: "Shin12", age: 12, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin13", age: 13, address: "Ha Noi", type: "FOLLOEWER"),
    User(name: "Shin14", age: 14, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin15", age: 15, address: "Ha Noi", type: "FOLLOEWER"),
    User(name: "Shin16", age: 16, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin17", age: 17, address: "Ha Noi", type: "FOLLOEWER"),
    User(name: "Shin18", age: 18, address: "Ha Noi", type: "FRIEND"),
    User(name: "Shin19", age: 19, address: "Ha Noi", type: "FOLLOEWER"),
]
