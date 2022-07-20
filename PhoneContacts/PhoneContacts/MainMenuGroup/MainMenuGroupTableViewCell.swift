//
//  MainMenuGroupTableViewCell.swift
//  PhoneContacts
//
//  Created by Andacuner on 14.06.2022.
//

import UIKit

class MainMenuGroupTableViewCell: UITableViewCell {

   
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func conf(title:String,image:UIImage,numberOfContents:String) {
        
        self.menuImageView.image = image
        self.titleLabel.text = title
        self.numberLabel.text = numberOfContents
        
    }
}
