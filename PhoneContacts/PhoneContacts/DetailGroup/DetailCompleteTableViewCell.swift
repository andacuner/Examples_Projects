//
//  DetailCompleteTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 16.06.2022.
//

import UIKit
import LetterAvatarKit
import ContactsUI
class DetailCompleteTableViewCell: UITableViewCell {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
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
    public func confContacts(cont:CNContact) {
        self.subtitleLabel.text = cont.phoneNumbers.first?.value.stringValue
        self.numberLabel.text = "1"
        self.titleLabel.text = cont.givenName
        self.imageDetail.image = LetterAvatarMaker()
            .setCircle(true)
            .setUsername(cont.givenName)
            .setBorderWidth(1.0)
            .setBackgroundColors([ .lightGray ])
            .setSize(CGSize.init(width: 40, height: 40))
            .build()
    }
    public func confBook(bookTy:ContactsType) {
        
        switch bookTy.type {
        case .local:
            self.titleLabel.text = "Local Address Book"
            self.imageDetail.image = UIImage(named: "apple")
            break
        case .cardDAV:
            self.titleLabel.text = "iCloud/Gmail"
            self.imageDetail.image = UIImage(named: "book")
            break
        case .unassigned:
            self.titleLabel.text = "Unassigned"
            self.imageDetail.image = UIImage(named: "reminder")
            break
        case .exchange:
            self.titleLabel.text = "Exchange Folder"
            self.imageDetail.image = UIImage(named: "exchange")

            break
        default:
            break
        }
        let contacts = PhoneContacts.shared.fetchContainer(container: bookTy.container)
        var str = ""
        for item in contacts {
            str = str + " " + item.givenName
        }
        self.numberLabel.text = String(contacts.count)
        self.subtitleLabel.text = str
        
        
        
    }
    public func conf(title:String,subtitle:String,isAccount:Bool,number:String) {
        
        if isAccount {
            
            self.imageDetail.image = LetterAvatarMaker()
                .setCircle(true)
                .setUsername(title)
                .setBorderWidth(1.0)
                .setBackgroundColors([ .lightGray ])
                .setSize(CGSize.init(width: 40, height: 40))
                .build()
            
        } else {
            
            self.imageDetail.image = LetterAvatarMaker()
                .setCircle(true)
                .setUsername(title)
                .setBorderWidth(1.0)
                .setBackgroundColors([ .lightGray ])
                .setSize(CGSize.init(width: 40, height: 40))
                .build()
            
        }
        self.numberLabel.text = number
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        
        
    }
    
}
