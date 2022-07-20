//
//  DetailContactsTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 14.06.2022.

import UIKit
import LetterAvatarKit
class DetailContactsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func conf(title:String,img:Data?) {
        self.textLabel?.text = title
        self.imageView?.image  = LetterAvatarMaker()
            .setCircle(true)
            .setUsername(title)
            .setBorderWidth(1.0)
            .setBackgroundColors([ .lightGray ])
            .setSize(CGSize.init(width: 40, height: 40))
            .build()
        
    }
    
}
