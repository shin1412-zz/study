//
//  CategoryViewController.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var circleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView(views: [circleView])
    }

}

extension CategoryViewController {
    func customView(views: [UIView]) {
        views.forEach { view in
            view.layer.cornerRadius = view.bounds.height / 2
        }
    }
}
