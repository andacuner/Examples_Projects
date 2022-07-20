//
//  MergeSelectHeaderTableViewCell.swift
//  PhoneContacts
//
//  Created by Yagiz on 20.06.2022.
//

import UIKit

class MergeSelectHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImageView: UIImageView!
    var selectedIndexs:[Int] = []
    var isSectionSelected = false
    @IBOutlet weak var sevronImageView: UIImageView!
    @IBOutlet weak var numberOfContactsLabel: UILabel!
    @IBOutlet weak var headerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    public func conf(isRowSelected:Bool,numberOfContacts:String,header:String) {
        
        self.numberOfContactsLabel.text = numberOfContacts
        self.headerLabel.text = header
        self.titleImageView.image = UIImage.init(named: "twoman")
        
    }
    public func confPhone(isRowSelected:Bool,numberOfContacts:String,header:String) {
        
        
        
    }
    public func confName(isRowSelected:Bool,numberOfContacts:String,header:String) {
        
        self.titleImageView.image = UIImage.init(systemName: "book.circle")!
        self.numberOfContactsLabel.text = numberOfContacts
        self.headerLabel.text = header
        
    }
    public func confMail(isRowSelected:Bool,numberOfContacts:String,header:String) {
       
        self.titleImageView.image = UIImage.init(systemName: "envelope.fill")!
        self.numberOfContactsLabel.text = numberOfContacts
        self.headerLabel.text = header
        
    }
    
}
