//
//  ContactsTableViewCell.swift
//  PhoneContacts
//
//  Created by Andacuner on 15.06.2022.

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func conf(name:String,surname:String,phone:String) {
        
        self.numberLabel.text = phone
        self.surnameLabel.text = surname
        self.titleLabel.text = name
        
        
    }
    
}
