//
//  AlertUntil.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

class AlertUtil {
    class func showImagePicker(from viewController: UIViewController, with title: String, message: String, completionCamera: (@escaping (UIAlertAction) -> Void), completionPicture: (@escaping (UIAlertAction) -> Void)) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            let presentCamera = UIAlertAction(title: "Take Photo", style: .default, handler: completionCamera)
            alert.addAction(presentCamera)
            let presentPicture = UIAlertAction(title: "Choose Photo", style: .default, handler: completionPicture)
            alert.addAction(presentPicture)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancel)
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
