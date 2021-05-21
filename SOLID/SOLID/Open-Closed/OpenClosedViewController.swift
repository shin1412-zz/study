//
//  OpenClosedViewController.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class OpenClosedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customView()
        self.other(message: "Open closed")
    }
    
    func customView() {
        
    }
}

extension OpenClosedViewController: OtherDelegate {
    func other(message: String) {
        let vc = OtherViewController()
        vc.other(message: message)
    }
}
