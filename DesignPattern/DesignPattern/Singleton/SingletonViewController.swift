//
//  SingletonViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

class SingletonViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var passwordVisibleSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        tfPassword.isSecureTextEntry = true
        passwordVisibleSwitch.isOn = false
        // Do any additional setup after loading the view.
    }
    
    @IBAction func passwordVisibleSwitched(_ sender: UISwitch) {
        Singleton.instance.showAlert()
        if sender.isOn {
            tfPassword.isSecureTextEntry = false
        } else {
            tfPassword.isSecureTextEntry = true
        }
    }

}

