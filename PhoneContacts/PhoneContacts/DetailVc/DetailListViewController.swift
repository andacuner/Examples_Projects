//
//  DetailListViewController.swift
//  PhoneContacts
//
//  Created by Andacuner on 14.06.2022.
//

import UIKit
import Contacts
import ContactsUI
class DetailListViewController: UIViewController,Storyboarded,UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.text == ""  {
            self.tempContactList = contactList
        }
        else {
            
            tempContactList = contactList.filter({$0.givenName.contains(searchController.searchBar.text ?? "")})
            
        }
        updateSearch()
        
    }
    var contactList:[CNContact] = []
    var tempContactList:[CNContact] = []
    var list :[String:[CNContact]] = [:]
    var sortedKeys:[String] = []
    @IBOutlet weak var detailTableCell: UITableView! {
        didSet {
            self.detailTableCell.tableFooterView = UIView()
            self.detailTableCell.delegate = self
            self.detailTableCell.dataSource = self
            self.detailTableCell.register(UINib.init(nibName: "DetailContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailContactsTableViewCell")
        }
    }
    var titleText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = titleText
        let searchController = UISearchController(searchResultsController: nil)
            searchController.searchResultsUpdater = self
            searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.automaticallyShowsScopeBar = false
            searchController.searchBar.placeholder = "Search"
            self.navigationItem.searchController = searchController
        
        self.navigationItem.hidesSearchBarWhenScrolling = false
            self.definesPresentationContext = false
        self.tempContactList = contactList
        updateSearch()
    }
    
    func updateSearch() {
        list = Dictionary(grouping: tempContactList, by: {String($0.givenName.prefix(1))})
       
        sortedKeys =  list.keys.sorted()
        self.detailTableCell.reloadData()
      
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CNContactViewController.init(for: list[sortedKeys[indexPath.section]]![indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
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
extension DetailListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list[sortedKeys[section]]?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedKeys.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailContactsTableViewCell", for: indexPath) as? DetailContactsTableViewCell else {
            return UITableViewCell()
        }
        cell.conf(title: list[sortedKeys[indexPath.section]]![indexPath.row].givenName, img: list[sortedKeys[indexPath.section]]![indexPath.row].imageData)
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedKeys[section]
    }
    
    
    
    
    
}
