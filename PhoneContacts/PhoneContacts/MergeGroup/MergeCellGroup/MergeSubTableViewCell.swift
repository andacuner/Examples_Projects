//
//  MergeSubTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 5.02.2021.
//

import UIKit
import LetterAvatarKit
import ContactsUI

class MergeSubTableViewCell: UITableViewCell {

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func conf(cont:CNContact) {
        
        imageUser.image = LetterAvatarMaker()
            .setCircle(true)
            .setUsername(cont.givenName)
            .setBorderWidth(1.0)
            .setBackgroundColors([ .lightGray ])
            .setSize(CGSize.init(width: 40, height: 40))
            .build()
        self.titleLabel.text = cont.givenName
        self.subtitleLabel.text = "Local Address Book"
        
        
    }
    
}
