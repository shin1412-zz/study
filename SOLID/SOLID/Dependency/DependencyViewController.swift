//
//  DependencyViewController.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

protocol UserService {
    func fetchUserList()
}
class APIService: UserService {
    func fetchUserList() {
        print("Fetch list user")
    }
}
class UserManager {
    let userService: UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    func getUserList() {
        userService.fetchUserList()
    }
}
class DependencyViewController: UIViewController {
    private var userManager: UserManager = UserManager(userService: APIService())

    override func viewDidLoad() {
        super.viewDidLoad()

        getListUserData()
    }

    func getListUserData() {
        userManager.getUserList()
    }
}

