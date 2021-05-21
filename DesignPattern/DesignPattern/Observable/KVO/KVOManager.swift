//
//  KVOManager.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import Foundation

class KVOManager: NSObject {
    @objc dynamic var kvo: KVO
    
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()

    var createAt: String {
        return dateFormatter.string(from: kvo.createAt)
    }
    
    var upDateAt: String {
        return dateFormatter.string(from: kvo.updateAt)
    }
    
    init(withKVO kvo: KVO) {
        self.kvo = kvo
        super.init()
    }
    
    func update() {
        kvo.updateAt = Date()
    }
}
