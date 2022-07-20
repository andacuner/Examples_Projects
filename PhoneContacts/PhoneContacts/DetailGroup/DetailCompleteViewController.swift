//
//  DetailCompleteViewController.swift
//  PhoneContacts
//
//  Created by Yagiz on 20.06.2022.
//

import UIKit
import ContactsUI
class DetailCompleteViewController: UIViewController,Storyboarded {

    var titleLabel = ""
    var getType:Types!
    var isSmartFilter = false
    var isAccount  = false
    var isNoData = false
    var datas = Dictionary<String,[CNContact]>()
    var keyList:[String] = []
    var tempDatas = Dictionary<String,[CNContact]>()
    var bookDatas:[ContactsType] = []
    var normalDatas:[CNContact] = []
    @IBOutlet weak var detailCompleteTableView: UITableView! {
        didSet {
            self.detailCompleteTableView.tableFooterView = UIView()
            self.detailCompleteTableView.delegate = self
            self.detailCompleteTableView.dataSource = self
            self.detailCompleteTableView.register(UINib.init(nibName: "DetailCompleteTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailCompleteTableViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if bookDatas.isEmpty && normalDatas.isEmpty  {
        keyList = datas.keys.sorted()
        
        self.detailCompleteTableView.reloadData()
        } else if !bookDatas.isEmpty {
            
        }
        self.title = titleLabel
        // Do any additional setup after loading the view.
        self.detailCompleteTableView.reloadData()
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
extension DetailCompleteViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if bookDatas.isEmpty && normalDatas.isEmpty {
        return datas.count
        } else if !bookDatas.isEmpty {
        return bookDatas.count
        } else {
            return normalDatas.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCompleteTableViewCell", for: indexPath) as? DetailCompleteTableViewCell else {
            return UITableViewCell()
        }
        if bookDatas.isEmpty && normalDatas.isEmpty {
        var str = ""
        for item in self.datas[keyList[indexPath.row]]! {
            
            str = str + " " + item.givenName
        }
        cell.conf(title: keyList[indexPath.row], subtitle: str, isAccount: isAccount, number: String(datas[keyList[indexPath.row]]?.count ?? 0))
        return cell
        } else if !bookDatas.isEmpty {
            cell.confBook(bookTy: bookDatas[indexPath.row])
            return cell
        } else {
            cell.confContacts(cont: normalDatas[indexPath.row])
            return cell
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.titleLabel
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.init(hexString: "#F4F5F6", withAlpha: 0.6)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.lightGray
        (view as! UITableViewHeaderFooterView).textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if normalDatas.isEmpty && bookDatas.isEmpty {
            
            if isSmartFilter {
                let vc = DetailListViewController.instantiate(with: .main)
                vc.contactList = self.datas[keyList[indexPath.row]]!
                vc.titleText = "Search contacts"
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
            let vc = MergeViewController.instantiate(with: .main)
            vc.mergedData = self.datas[keyList[indexPath.row]]!
            
            self.navigationController?.pushViewController(vc, animated: true)
            }
            
        } else if !normalDatas.isEmpty {
            let vc = CNContactViewController.init(for: self.normalDatas[indexPath.row])
            self.navigationController?.pushViewController(vc, animated: true)
        } else if !bookDatas.isEmpty {
            let vc = DetailListViewController.instantiate(with: .main)
            vc.contactList = bookDatas[indexPath.row].contacts
            vc.titleText = "Search contacts"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
}
public enum Types {
    
    case email
    case phone
    case name
    case birthday
    case nameMail
    case contacts
    
    
}
