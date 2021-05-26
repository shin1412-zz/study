//
//  ManagerRealmData.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import Foundation
import RealmSwift

class ManagerRealm {
    // Khai báo biến tham chiếu tới csdl Realm
    private var database: Realm
    
    // singleton
    static let sharedInstance = ManagerRealm()
    
    private init() {
        // create realm database
        database = try! Realm()
        print(database.configuration.fileURL)
    }

    // insert data
    func addData(object: Contact) {
        try! database.write {
            print("Add new object")
            object.id = UUID().uuidString
            database.add(object)
        }
    }

    // get data
    func getDataFromDB() -> Results<Contact> {
        let results: Results<Contact> = database.objects(Contact.self)
        return results
    }

    // delete object
    func deleleData(object: Contact) {
        try! database.write {
            database.delete(object)
        }
    }

    // update object by id
    func updateFromDB(id: String, name: String, age: String, address: String, phoneNumber: String, photo: Data) {
        try! database.write {
            let result = database.objects(Contact.self)
            for item in result {
                if item.id == id {
                    item.name = name
                    item.age = age
                    item.address = address
                    item.phoneNumber = phoneNumber
                    item.photo = photo
                }
            }
        }
    }
}
