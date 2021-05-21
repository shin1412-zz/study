//
//  LiskovViewController.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class LiskovViewController: UIViewController {

    private var car = Car()
    private var bicycle = Bicycle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car.move()
        bicycle.move()
    }

}
