//
//  MainMenuViewController.swift
//  PhoneContacts
//
//  Created by Yagiz on 3.02.2021.
//

import UIKit
import ContactsUI
class MainMenuViewController: UIViewController,Storyboarded {
    
    var firstSectionDatas:[MainMenuGroup] = []
    var contacts:[CNContact] = []
    @IBOutlet weak var mainMenuTableView: UITableView! {
        didSet {
            self.mainMenuTableView.delegate = self
            self.mainMenuTableView.tableFooterView = UIView()
            self.mainMenuTableView.dataSource = self
            self.mainMenuTableView.register(UINib.init(nibName: "MainMenuGroupTableViewCell", bundle: nil), forCellReuseIdentifier: "MainMenuGroupTableViewCell")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = PhoneContacts.getContacts(filter: .none)
        self.mainMenuTableView.reloadData()
        
    }
    


}
extension MainMenuViewController:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        case 2:
            return 3
        case 3:
            return 3
        default:
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "General"
        case 1:
            return "Duplicates"
        case 2:
            return "Missing information"
        case 3:
            return "Smart Filters"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.init(hexString: "#F4F5F6", withAlpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.lightGray
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                cell.conf(title: "All Contacts", image: UIImage.init(systemName: "person.fill")!, numberOfContents: String(self.contacts.count))
                return cell
            default:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                cell.conf(title: "Accounts", image: UIImage.init(systemName: "rectangle.stack.person.crop.fill")!, numberOfContents: String(PhoneContacts.shared.bookType.count))
                return cell
            }
            
        case 1:
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                cell.conf(title: "Duplicate Contacts", image: UIImage.init(systemName: "person.2.fill")!, numberOfContents: String(PhoneContacts.shared.duplicateContacts.count))
                return cell
                
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                cell.conf(title: "Duplicate Phone Numbers", image: UIImage.init(systemName: "phone.circle.fill")!, numberOfContents: String(PhoneContacts.shared.duplicatePhoneNumbers.count))
                return cell
            case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                return UITableViewCell()
            }
                cell.conf(title: "Duplicate Emails", image: UIImage.init(systemName: "envelope.fill")!, numberOfContents: String(PhoneContacts.shared.duplicateMails.count))
            return cell
            case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                return UITableViewCell()
            }
                cell.conf(title: "Similar names", image: UIImage.init(systemName: "book.circle")!, numberOfContents: String(PhoneContacts.shared.duplicateContacts.count))
            return cell
            default:
                return UITableViewCell()
            }
            case 2:
                switch indexPath.row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.conf(title: "Unnamed", image: UIImage.init(systemName: "person.crop.circle.fill.badge.xmark")!, numberOfContents: String(PhoneContacts.shared.withoutName.count))
                    return cell
                    
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.conf(title: "No phone number", image: UIImage.init(systemName: "phone.fill.arrow.right")!, numberOfContents: String(PhoneContacts.shared.withoutPhoneNumber.count))
                    return cell
                case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                    cell.conf(title: "No phone and Email", image: UIImage.init(systemName: "envelope.fill")!, numberOfContents: String(PhoneContacts.shared.withoutNameEmail.count))
                return cell
                default:
                    return UITableViewCell()
                }
            case 3:
                switch indexPath.row {
                case 0:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.conf(title: "Birthday", image: UIImage.init(systemName: "gift.fill")!, numberOfContents: String(PhoneContacts.shared.birthdayGroup.count))
                    return cell
                    
                case 1:
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                        return UITableViewCell()
                    }
                    cell.conf(title: "Company", image: UIImage.init(systemName: "paperclip.circle.fill")!, numberOfContents: String(PhoneContacts.shared.organizationName.count))
                    return cell
                case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                    return UITableViewCell()
                }
                    cell.conf(title: "Job Title", image: UIImage.init(systemName: "bubble.left.and.bubble.right.fill")!, numberOfContents: String(PhoneContacts.shared.jobTitleGroup.count))
                return cell
                default:
                    return UITableViewCell()
                }
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuGroupTableViewCell", for: indexPath) as? MainMenuGroupTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let vc = DetailListViewController.instantiate(with: .main)
                vc.contactList = self.contacts
                vc.titleText = "All Contacts"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 1:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.titleLabel = "Accounts"
                vc.bookDatas = PhoneContacts.shared.bookType
                self.navigationController?.pushViewController(vc, animated: true)
                break
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.datas = PhoneContacts.shared.duplicateContacts
                vc.titleLabel = "Duplicate Contacts"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 1:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.datas = PhoneContacts.shared.duplicatePhoneNumbers
                vc.titleLabel = "Duplicate Phone Numbers"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 2:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.datas = PhoneContacts.shared.duplicateMails
                vc.titleLabel = "Duplicate Emails"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 3:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.datas = PhoneContacts.shared.duplicateContacts
                vc.titleLabel = "Similar Names"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            default:
                break
            }
            break
        case 2:
            switch indexPath.row {
            case 0:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.normalDatas = PhoneContacts.shared.withoutName
                vc.titleLabel = "Unnamed"
                
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 1:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.normalDatas = PhoneContacts.shared.withoutPhoneNumber
                vc.titleLabel = "No phone number"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 2:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.normalDatas = PhoneContacts.shared.withoutNameEmail
                vc.titleLabel = "No phone and Email"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            default:
                break
            }
            break
        case 3:
            switch indexPath.row {
            case 0:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.isSmartFilter = true
                vc.datas = PhoneContacts.shared.birthdayGroup
                vc.titleLabel = "Birthday"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 1:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.isSmartFilter = true
                vc.datas = PhoneContacts.shared.organizationName
                vc.titleLabel = "Company"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            case 2:
                let vc = DetailCompleteViewController.instantiate(with: .main)
                vc.isSmartFilter = true
                vc.datas = PhoneContacts.shared.jobTitleGroup
                vc.titleLabel = "Job Title"
                self.navigationController?.pushViewController(vc, animated: true)
                break
            default:
                break
            }
            break
        default:
           break
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    
    
    
    
}
struct MainMenuGroup {
    
    var title:String!
    var numberOfContents:String!
    var groupImage:UIImage!
    var contact:CNContact!
    
    
}
