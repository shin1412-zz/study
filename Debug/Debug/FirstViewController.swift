//
//  FirstViewController.swift
//  Debug
//
//  Created by Huong Nguyen on 24/05/2021.
//

import UIKit

class People {
    let city: String
    weak var user: User?
    
    init(city: String) {
        self.city = city
        print("People \(city) is initialized")
    }

    deinit {
        print("People \(city) is being deallocated")
    }
}

class User {
    var name: String
    var people: People?

    init(name: String) {
        self.name = name
        print("User \(name) is initialized")
    }
    
    deinit {
        print("User \(name) is being deallocated")
    }
}

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var user: User? = User(name: "Shin")
        var people: People? = People(city: "Hà Nội")
        
        people?.user = user
        user?.people = people
        user = nil
        people = nil
    }

    @IBAction func nextToView(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.message = "Hello world 🤮!"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
