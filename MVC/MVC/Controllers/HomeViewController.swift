//
//  HomeViewController.swift
//  MVC
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    
    var a: Float {
        get {
            return Float(tfA.text!) ?? 0
        }
    }
    
    var b: Float {
        get {
            return Float(tfB.text!) ?? 0
        }
    }
    
    var result: Float = 0 {
        didSet {
            tfResult.text = "\(result)"
        }
    }

    // model
    var calculator = Calculator()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func aa(_ sender: Any) {
        result = calculator.add(a: self.a, b: self.b)
    }
    
    @IBAction func sub(_ sender: Any) {
        result = calculator.sub(a: self.a, b: self.b)
    }
    
    @IBAction func mul(_ sender: Any) {
        result = calculator.mul(a: self.a, b: self.b)
    }
    
    @IBAction func div(_ sender: Any) {
        result = calculator.div(a: self.a, b: self.b)
    }
    
}
