//
//  FacadeViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 20/05/2021.
//

import UIKit

class FacadeViewController: UIViewController {
    
    var facade = Facade()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        facade.wrapOperation()
        facade.start()
        facade.end()
    }
}
