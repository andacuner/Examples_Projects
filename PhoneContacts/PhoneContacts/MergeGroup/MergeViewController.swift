//
//  MergeViewController.swift
//  PhoneContacts
//
//  Created by Yagiz on 14.06.2022.
//

import UIKit
import ContactsUI
class MergeViewController: UIViewController,Storyboarded {

    
    var mergedData:[CNContact] = []
    @IBOutlet weak var mergeTableView: UITableView! {
        didSet {
            self.mergeTableView.tableFooterView = UIView()
            self.mergeTableView.delegate = self
            self.mergeTableView.dataSource = self
            self.mergeTableView.register(UINib.init(nibName: "MergeMainTableViewCell", bundle: nil), forCellReuseIdentifier: "MergeMainTableViewCell")
            self.mergeTableView.register(UINib.init(nibName: "MergeSubTableViewCell", bundle: nil), forCellReuseIdentifier: "MergeSubTableViewCell")
        }
    }
    var mergedContact:CNContact!
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        mergedContact = merge(duplicates: mergedData)
        
        self.mergeTableView.reloadData()
    }
  

}
extension MergeViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return mergedData.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MergeMainTableViewCell", for: indexPath) as? MergeMainTableViewCell else {
                return UITableViewCell()
            }
            
            cell.conf(cont: mergedContact)
            return cell
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MergeSubTableViewCell", for: indexPath) as? MergeSubTableViewCell else {
                return UITableViewCell()
            }
            cell.conf(cont: mergedData[indexPath.row])
            
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Merged person (preview)"
        } else {
            return "Duplicates (will be deleted)"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            
            let vc = CNContactViewController.init(for: mergedContact)
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else {
            
            let vc = CNContactViewController.init(for: mergedData[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.init(hexString: "#F4F5F6", withAlpha: 0.6)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.lightGray
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            
            return 80
            
        } else {
            
            return 83
            
        }
    }
    
    
    
}
extension Array where Element == String {

    var bestElement: String? {
        var options: [String : Int] = [:]

        for element in self {
            if let result = options[element] {
                options[element] = result + 1
            } else {
                options[element] = 1
            }
        }

        return options.sorted { $0.1 > $1.1 }.first?.key
    }
}

extension MergeViewController {
func merge(duplicates: [CNContact]) -> CNContact {
    
    var givenName: [String] = []
    var familyName: [String] = []
    var organizationName: [String] = []
    var notes: [String] = []

    var phoneNumbers: [CNLabeledValue<CNPhoneNumber>] = []
    var emailAddresses: [CNLabeledValue<NSString>] = []
    var postalAddresses: [CNLabeledValue<CNPostalAddress>] = []
    var urlAddresses: [CNLabeledValue<NSString>] = []

   
    for contact in duplicates {
        givenName.append(contact.givenName)
        familyName.append(contact.familyName)
        organizationName.append(contact.organizationName)
      

        contact.phoneNumbers.forEach { phoneNumbers.append($0) }
        contact.emailAddresses.forEach { emailAddresses.append($0) }
        contact.postalAddresses.forEach { postalAddresses.append($0) }
        contact.urlAddresses.forEach { urlAddresses.append($0) }
    }

    // MERGE TO NEW CONTACT
    let newContact = CNMutableContact()
    newContact.givenName = givenName.bestElement ?? ""
    newContact.familyName = familyName.bestElement ?? ""
    newContact.organizationName = organizationName.bestElement ?? ""
  //  newContact.note = notes.joined(separator: "\n")

    newContact.phoneNumbers = phoneNumbers
    newContact.emailAddresses = emailAddresses
    newContact.postalAddresses = postalAddresses
    newContact.urlAddresses = urlAddresses

    return newContact
}
}
