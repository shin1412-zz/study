//
//  LoginViewController.swift
//  MVVM
//
//  Created by Huong Nguyen on 24/05/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!

    var viewModel = LoginViewModel(email: "", password: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initComponent()
    }

    func initData() {
        
    }
    
    func initComponent() {
        updateView()
    }
    
    func updateView() {
        tfEmail.text = viewModel.email
        tfPassword.text = viewModel.password
    }
    
    @IBAction func login(_ sender: Any) {
        let email = tfEmail.text ?? ""
        let password = tfPassword.text ?? ""
        
        let complete: LoginViewModel.completion = { (result) in
            switch result {
            case .success:
                print("sucsess")
                self.updateView()
            case .failure(let error, let errorMess):
                if error {
                    print("failure")
                    print(errorMess)
                }
            }
        }
        
        viewModel.login(email: email, password: password, completion: complete)
    }
    
}
