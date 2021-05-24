//
//  LoginViewModel.swift
//  MVVM
//
//  Created by Huong Nguyen on 24/05/2021.
//

enum LoginResult {
    case success
    case failure(Bool, String)
}

class LoginViewModel {
    // properties
    var email: String?
    var password: String?
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }

    typealias completion = (LoginResult) -> Void
    // actions
    func login(email: String, password: String, completion: completion) {
        if email.isEmpty || password.isEmpty {
            //callback
            completion(.failure(true, "email or password is emptied"))
        } else {
            self.email = ""
            self.password = ""
            completion(.success)
        }
    }
}
