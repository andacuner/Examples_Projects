//
//  MergeMainTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 5.02.2021.
//

import UIKit
import ContactsUI
import LetterAvatarKit

class MergeMainTableViewCell: UITableViewCell {

    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    public func conf(cont:CNContact) {
        
        profileLabel.text = cont.givenName
        profileImage.image = LetterAvatarMaker()
            .setCircle(true)
            .setUsername(cont.givenName)
            .setBorderWidth(1.0)
            .setBackgroundColors([ .lightGray ])
            .setSize(CGSize.init(width: 40, height: 40))
            .build()
        whereLabel.text = "Local Address Book"
        
    }
    
}
