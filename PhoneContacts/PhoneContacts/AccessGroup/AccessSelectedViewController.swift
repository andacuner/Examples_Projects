//
//  AccessSelectedViewController.swift
//  PhoneContacts
//
//  Created by Andacuner on 12.06.2022.
//

import UIKit
import ContactsUI
class AccessSelectedViewController: UIViewController,Storyboarded {

    var sceneDelegate:SceneDelegate {
        return UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
    }
    @IBAction func checkAccessFunc(_ sender: Any) {
        
        if isGiven {
            sceneDelegate.startApp()
        } else {
            let alert = UIAlertController(title: "Error", message: "Please Apply Contacts Permission", preferredStyle: .alert)
            let act = UIAlertAction(title: "Ok", style: .default, handler: {action in
                
            })
            alert.addAction(act)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    var isGiven = false {
        didSet {
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        checkContacts()
    }
    func checkContacts() {
        CNContactStore().requestAccess(for: .contacts) { (access, error) in
            self.isGiven = access
            
        }
        
    }
    
}
