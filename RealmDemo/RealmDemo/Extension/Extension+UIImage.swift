//
//  Extension+UIImage.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

extension UIImageView {
    func makeRouned() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}

extension UIButton {
    func makeRouned() {
        self.layer.cornerRadius = 10
    }
}
