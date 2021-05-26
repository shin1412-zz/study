//
//  Contact.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import Foundation
import RealmSwift

class Contact: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var age = ""
    @objc dynamic var address = ""
    @objc dynamic var phoneNumber = ""
    @objc dynamic var photo = Data()

    override class func primaryKey() -> String? {
        return "id"
    }
}
