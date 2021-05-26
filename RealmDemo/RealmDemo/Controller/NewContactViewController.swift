//
//  NewContactViewController.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

enum State {
    case create
    case update
    case view
}

class NewContactViewController: UIViewController {

    @IBOutlet weak var tfNAme: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var tfPhoneNumber: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var imgCamera: UIImageView!
    
    var isState: State = .create
    var item = Contact()

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        initComponent()
    }

    fileprivate func initData() {
        switch isState {
        case .create:
            print("Create")
        default:
            tfNAme.text = item.name
            tfAge.text = item.age
            tfAddress.text = item.address
            tfPhoneNumber.text = item.phoneNumber
            imgAvatar.image = UIImage(data: item.photo)
        }
    }

    fileprivate func initComponent() {
        if isState == .view {
            tfAge.isUserInteractionEnabled = false
            tfNAme.isUserInteractionEnabled = false
            tfAddress.isUserInteractionEnabled = false
            tfPhoneNumber.isUserInteractionEnabled = false
            imgAvatar.isUserInteractionEnabled = false
            btnSave.isHidden = true
        } else {
            tfAge.isUserInteractionEnabled = true
            tfNAme.isUserInteractionEnabled = true
            tfAddress.isUserInteractionEnabled = true
            tfPhoneNumber.isUserInteractionEnabled = true
            imgAvatar.isUserInteractionEnabled = true
            btnSave.isHidden = false
        }
        imgAvatar.makeRouned()
        btnSave.makeRouned()
        
        imgCamera.layer.cornerRadius = imgCamera.bounds.width / 2
        imgCamera.layer.borderWidth = 2
        imgCamera.layer.borderColor = UIColor.white.cgColor

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imgAvatar.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped() {
        presentPhotoActionSheet()
    }

    @IBAction func dismissView(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveContact(_ sender: Any) {
        guard let name = tfNAme.text, let age = tfAge.text, let address = tfAddress.text, let phoneNumber = tfPhoneNumber.text, let photo = imgAvatar.image?.pngData() else {
            return
        }
        switch isState {
        case .create:
            let object = Contact()
            object.name = name
            object.age = age
            object.address = address
            object.phoneNumber = phoneNumber
            object.photo = photo
            
            ManagerRealm.sharedInstance.addData(object: object)
        default:
            print("Update", item)
            ManagerRealm.sharedInstance.updateFromDB(id: item.id, name: name, age: age, address: address, phoneNumber: phoneNumber, photo: photo)
        }
        self.dismiss(animated: true, completion: nil)
    }
}

extension NewContactViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        AlertUtil.showImagePicker(from: self, with: "Avatar", message: "How would you like to select a picture?") { [weak self] (_) in
            self?.presentCamera()
        } completionPicture: { [weak self] (_) in
            self?.presentPhotoPicker()
        }
    }

    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imgAvatar.image = resizeImage(image: selectedImage, targetSize: CGSize(width: 170, height: 170))
        
        }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
