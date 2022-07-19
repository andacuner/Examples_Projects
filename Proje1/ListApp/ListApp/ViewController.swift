
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var data = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text=data[indexPath.row]
        return cell
    }
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem){
        
        
        let alertController = UIAlertController(title: "Add New" ,
                                                message: nil,
                                                preferredStyle: .alert)
        let defaultButton = UIAlertAction(title: "Add",
                                          style: .default) { _ in
            
            
            let Yazi = alertController.textFields?.first?.text
            if Yazi != ""{
                self.data.append(Yazi ?? "Emphty")
                self.tableView.reloadData()
            }
            else{
                
                let alertController = UIAlertController(title: "Warning",
                                                        message: "Please Fill The Slots First",
                                                        preferredStyle: .alert)
                
                self.present(alertController, animated: true)
                
                let cancelButton = UIAlertAction(title: "Close",
                                                 style: .cancel)
                
                alertController.addAction(cancelButton)
                
            }
            
        }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField()
        alertController.addAction(defaultButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
    
        
    }
    @IBAction func didRemoveBarButtonTapped(_ sender: UIBarButtonItem){
        
        
        let alertController = UIAlertController(title: "Warning",
                                                message: "All Data Deleted",
                                                preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel",
                                         style: .cancel)
        let defaultButton = UIAlertAction(title: "Delete",
                                          style: .default) { _ in
            self.data.removeAll()
            self.tableView.reloadData()
        
        }
        alertController.addAction(cancelButton)
        alertController.addAction(defaultButton)
        self.present(alertController, animated: true)
      
    }
 
    //func presentAlert(title: String?,
          //            message :String?,
            //          prefferedStyle: UIAlertController.Style,
              //        cancelButtonTitle: String?)   {
        
        
        //let alertController = UIAlertController(title: title,
                  //                              message: message,
                //                                preferredStyle: prefferedStyle)
        
       // let cancelButton = UIAlertAction(title: title,
                    //                     style: .cancel)
        
    //}
}
