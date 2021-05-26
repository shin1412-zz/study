//
//  ContactTableViewCell.swift
//  RealmDemo
//
//  Created by Huong Nguyen on 26/05/2021.
//

import UIKit

class ContactTableViewCell: BaseTBCell {

    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    @IBOutlet weak var lbPhone: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpCell(object: Contact) {
        self.imgAvatar.makeRouned()
        
        self.imgAvatar.image = UIImage(data: object.photo)
        self.lbName.text = object.name
        self.lbAge.text = "\(object.age)T"
        self.lbAddress.text = object.address
        self.lbPhone.text = object.phoneNumber
    }
    
}
