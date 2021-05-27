import UIKit

class Person: NSObject, NSCoding {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    enum Key: String {
        case name
        case age
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: Key.name.rawValue)
        coder.encode(age, forKey: Key.age.rawValue)
    }
    
    required init(coder: NSCoder) {
        name = coder.decodeObject(forKey: Key.name.rawValue) as? String ?? ""
        age = coder.decodeInteger(forKey: Key.age.rawValue)
    }
    
    
}

let person = Person(name: "Huowng", age: 23)

let userdefaults = UserDefaults.standard
// biến instance person thành dạng Data và lưu lại
if let data = try? NSKeyedArchiver.archivedData(withRootObject: person, requiringSecureCoding: false) {
    userdefaults.set(data, forKey: "data")
}

// chuyển đổi data trở lại thành instance của class Person
if let savedData = userdefaults.object(forKey: "data") as? Data {
    if let decoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedData) as? Person {
        let person = decoded
        print(person.name)
    }
}
