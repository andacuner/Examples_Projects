//
//  ViewController.swift
//  PhoneContacts
//
//  Created by Andacuner on 13.06.2022.
//

import UIKit
import ContactsUI
class ViewController: UIViewController {

    
    var contacts:[CNContact] = []
    @IBOutlet weak var contactsTableView: UITableView! {
        didSet {
            self.contactsTableView.delegate = self
            self.contactsTableView.dataSource = self
            self.contactsTableView.register(UINib.init(nibName: "ContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactsTableViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = PhoneContacts.getContacts(filter: .none)
        
        self.contactsTableView.reloadData()
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsTableViewCell") as? ContactsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.conf(name: contacts[indexPath.row].givenName + " " + contacts[indexPath.row].familyName, surname: contacts[indexPath.row].emailAddresses.first?.value.description ?? "", phone: contacts[indexPath.row].phoneNumbers.first?.value.stringValue ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 102
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
        
            let req = CNSaveRequest()
            let editContact = self.contacts[indexPath.row].mutableCopy() as! CNMutableContact
            req.delete(editContact)
            try! CNContactStore().execute(req)
            contacts = PhoneContacts.getContacts(filter: .none)
           
            self.contactsTableView.reloadData()
        
        }
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
       
            
    }
    
    
    
    
    
    
}
