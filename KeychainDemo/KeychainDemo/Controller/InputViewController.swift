//
//  InputViewController.swift
//  KeychainDemo
//
//  Created by Huong Nguyen on 27/05/2021.
//

import UIKit
import KeychainAccess

class InputViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var btnCance: UIBarButtonItem!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func saveButton(_ sender: Any) {
        let keychain: Keychain
        if let service = tfPhone.text, !service.isEmpty {
            keychain = Keychain(service: service)
        } else {
            keychain = Keychain()
        }
        keychain[tfName.text ?? ""] = tfAge.text

        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func editingChanged(_ sender: UITextField) {
        switch (tfName.text, tfAge.text) {
        case let (username?, password?):
            btnSave.isEnabled = !username.isEmpty && !password.isEmpty
        case (_?, nil):
            btnSave.isEnabled = false
        case (nil, _?):
            btnSave.isEnabled = false
        case(nil, nil):
            btnSave.isEnabled = false
        }
    }
}
