//
//  SecondViewController.swift
//  Debug
//
//  Created by Huong Nguyen on 24/05/2021.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lbMessage: UILabel!

    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let message = self.message {
            lbMessage.text = message
        }
    }

    deinit {
        print("vc2 was deallocated from memory")
    }

}
