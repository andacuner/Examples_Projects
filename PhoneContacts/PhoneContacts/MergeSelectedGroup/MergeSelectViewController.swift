//
//  MergeSelectViewController.swift
//  PhoneContacts
//
//  Created by andacuner on 23.06.2022.
//

import UIKit

class MergeSelectViewController: UIViewController,Storyboarded {

    @IBOutlet weak var mergeSelectTableView: UITableView! {
        didSet {
            self.mergeSelectTableView.tableFooterView = UIView()
            self.mergeSelectTableView.delegate = self
            self.mergeSelectTableView.dataSource = self
            self.mergeSelectTableView.register(UINib.init(nibName: "MergeSelectHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "MergeSelectHeaderTableViewCell")
        }
    }
    var selectedFirstSectionIndexs:[Int] = []
    var selectedSecondSectionIndexs:[Int] = []
    var checkFirst = false
    var checkSecond = false
    var checkThird = false
    var isFirstSectionRowSelected = false
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MergeSelectViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Duplicates"
        } else {
            return "Select Possible Repetitions"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if PhoneContacts.shared.duplicatePhoneNumbers.count + PhoneContacts.shared.duplicateMails.count == 0 {
            return 1
        }
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.init(hexString: "#F4F5F6", withAlpha: 1)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.lightGray
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            
            return PhoneContacts.shared.duplicatePhoneNumbers.count + PhoneContacts.shared.duplicateMails.count
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MergeSelectDetailViewController.instantiate(with: .main)
        if indexPath.section == 0 {
        
            vc.title = "Duplicate Contacts"
            vc.dupType = .sameContacts
        
        } else {
            
            if indexPath.row == 0 {
                
                
                if PhoneContacts.shared.duplicatePhoneNumbers.count > 0 {
                    vc.title = "Duplicate Phone Numbers"
                    vc.dupType = .samePhone
                } else if PhoneContacts.shared.duplicateMails.count > 0 {
                    vc.title = "Duplicate E-mails"
                    vc.dupType = .sameEmail
                }
                
            } else if indexPath.row == 1 {
                    vc.title = "Duplicate E-mails"
                    vc.dupType = .sameEmail
                
                
            }
            
        }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MergeSelectHeaderTableViewCell", for: indexPath) as? MergeSelectHeaderTableViewCell else {
                return UITableViewCell()
            }
        if indexPath.section == 0 {
            
            cell.conf(isRowSelected: isFirstSectionRowSelected, numberOfContacts: String(PhoneContacts.shared.duplicateContacts.count), header: "Duplicate Contacts")
         
            
            
        } else {
           
            if indexPath.row == 0 {
                
                if PhoneContacts.shared.duplicatePhoneNumbers.count > 0 {

                    cell.confName(isRowSelected: false, numberOfContacts: PhoneContacts.shared.duplicatePhoneNumbers.count.toString(), header: "Duplicate Phone Numbers")
                    
                } else if PhoneContacts.shared.duplicateMails.count > 0 {
                    
                    cell.confMail(isRowSelected: false, numberOfContacts: PhoneContacts.shared.duplicateMails.count.toString(), header: "Duplicate E-mails")
                }
                
            } else {
                cell.confMail(isRowSelected: false, numberOfContacts: PhoneContacts.shared.duplicateMails.count.toString(), header: "Duplicate E-mails")
            }
            
            
        }
        
        
            return cell

    }
    
    
    
    
    
}
extension Int {
    
    func toString() -> String {
        
        return String(self)
        
    }
    
}
