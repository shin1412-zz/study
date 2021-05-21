//
//  PhotoTableViewCell.swift
//  MVP
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit
import Kingfisher

class PhotoTableViewCell: BaseTBCell {

    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setUpCell(data: PhotoAttribute) {
        lbName.text = data.title
        guard let url = URL(string: data.url_c ?? "") else {return}
        imgView.kf.setImage(with: url)
    }
}
