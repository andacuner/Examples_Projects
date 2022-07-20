//
//  MergeDetailSelectTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 14.02.2021.
//

import UIKit
import LetterAvatarKit
class MergeDetailSelectTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    var infoClicked:(()->())?
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userCheckedImageView: CustomImageCircular!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func infoSelected() {
        
        infoClicked?()
        
    }
    public func conf(isSelected:Bool,title:String,detail:String) {
        infoImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(infoSelected)))
        userImage.image =  LetterAvatarMaker()
            .setCircle(true)
            .setUsername(title)
            .setBackgroundColors([ .lightGray ])
            .setSize(CGSize.init(width: 40, height: 40))
            .build()
        if isSelected {
            self.userCheckedImageView.tintColor = .systemOrange
            self.userCheckedImageView.image = UIImage.init(systemName: "checkmark.circle.fill")
        } else {
            self.userCheckedImageView.tintColor = .white
            self.userCheckedImageView.image = UIImage.init(systemName: "circle.fill")
        }
        
        self.titleLabel.text = title
        self.detailLabel.text = detail
    }
    
}
