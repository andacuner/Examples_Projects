//
//  MergeSelectDetailViewController.swift
//  PhoneContacts
//
//  Created by Yagiz on 14.02.2021.
//

import UIKit

class MergeSelectDetailViewController: UIViewController,Storyboarded {
    
    @IBOutlet weak var mergeButton: CustomButtonWithRadiusAndShadow!
    @IBAction func mergeDetailAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "Merge", style: .default, handler: {action in
            
            
            
        })
        let actionFirst = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
            
            
        })
        alert.addAction(action)
        alert.addAction(actionFirst)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    var dupType:DupType!
    var selectedIndex:[Int] = []
    var keyList:[String] = []
    @IBOutlet weak var mergeDetailTableView: UITableView! {
        didSet {
            self.mergeDetailTableView.tableFooterView = UIView()
            self.mergeDetailTableView.delegate = self
            self.mergeDetailTableView.dataSource = self
            self.mergeDetailTableView.register(UINib.init(nibName: "MergeDetailSelectTableViewCell", bundle: nil), forCellReuseIdentifier: "MergeDetailSelectTableViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch dupType {
        case .sameContacts:
            keyList = PhoneContacts.shared.duplicateContacts.keys.sorted()
            for item in 0...PhoneContacts.shared.duplicateContacts.count - 1 {
                selectedIndex.append(item)
            }
            break
        case .sameEmail:
            keyList = PhoneContacts.shared.duplicateMails.keys.sorted()
            for item in 0...PhoneContacts.shared.duplicateMails.count - 1 {
                selectedIndex.append(item)
            }
            break
        case .samePhone:
            keyList = PhoneContacts.shared.duplicatePhoneNumbers.keys.sorted()
            for item in 0...PhoneContacts.shared.duplicatePhoneNumbers.count - 1 {
                selectedIndex.append(item)
            }
            break
        default:
            break
        }
        self.mergeDetailTableView.reloadData()
        
        
    }

}
extension MergeSelectDetailViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dupType {
        case .sameContacts:
            return PhoneContacts.shared.duplicateContacts.count
        case .sameEmail:
            return PhoneContacts.shared.duplicateMails.count
        case .samePhone:
            return PhoneContacts.shared.duplicatePhoneNumbers.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MergeDetailSelectTableViewCell", for: indexPath) as? MergeDetailSelectTableViewCell else {
            return UITableViewCell()
        }
        
        switch dupType {
        case .sameContacts:
            cell.conf(isSelected: selectedIndex.contains(indexPath.row), title: keyList[indexPath.row], detail: PhoneContacts.shared.duplicateContacts.count.toString() + " " + (self.title ?? ""))
            break
        case .sameEmail:
            cell.conf(isSelected: selectedIndex.contains(indexPath.row), title: keyList[indexPath.row], detail: PhoneContacts.shared.duplicateMails.count.toString() + " " + (self.title ?? ""))
            break
        case .samePhone:
            cell.conf(isSelected: selectedIndex.contains(indexPath.row), title: keyList[indexPath.row], detail: PhoneContacts.shared.duplicatePhoneNumbers.count.toString() + " " + (self.title ?? ""))
            break
            
        default:
          break
        }
        cell.infoClicked = {
            
            let vc = MergeViewController.instantiate(with: .main)
            switch self.dupType {
            case .sameContacts:
                vc.mergedData = PhoneContacts.shared.duplicateContacts[self.keyList[indexPath.row]] ?? []
                break
            case .sameEmail:
                vc.mergedData = PhoneContacts.shared.duplicateMails[self.keyList[indexPath.row]] ?? []
              
                break
            case .samePhone:
                vc.mergedData = PhoneContacts.shared.duplicatePhoneNumbers[self.keyList[indexPath.row]] ?? []
                break
            default: break

            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.selectedIndex.contains(indexPath.row) {
            var currentIndex =  0
            var ifFound = false
            for item in self.selectedIndex {
            
                if item == indexPath.row {
                    ifFound = true
                    
                    break
                    
                }
                currentIndex = currentIndex + 1
                
            }
            if ifFound {
            self.selectedIndex.remove(at: currentIndex)
            }
            
            self.mergeDetailTableView.reloadData()
        } else {
            
            self.selectedIndex.append(indexPath.row)
            self.mergeDetailTableView.reloadData()
        }
        
    }
    
    
    
    
    
}
enum DupType {
    
    case sameContacts
    case sameEmail
    case samePhone
    
}
