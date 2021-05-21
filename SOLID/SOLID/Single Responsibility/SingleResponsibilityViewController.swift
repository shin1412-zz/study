//
//  SingleResponsibilityViewController.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

class SingleResponsibilityViewController: UIViewController {

    var presenter: SinglePresenter?
    var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView()
        self.presenter?.requestData()
        print(data)
    }

    func customView() {
        
    }

    func setup(presenter: SinglePresenter) {
        self.presenter = presenter
    }
}

extension SingleResponsibilityViewController: SinglePresenterDelegate {
    func fetchData(data: String) {
        self.data = data
    }
}

