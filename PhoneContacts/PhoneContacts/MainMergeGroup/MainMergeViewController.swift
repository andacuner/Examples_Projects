//
//  MainMergeViewController.swift
//  PhoneContacts
//
//  Created by andacuner on 25.06.2022.
//

import UIKit

class MainMergeViewController: UIViewController {

    @IBAction func clickAction(_ sender: Any) {
       
        let vc = MergeSelectViewController.instantiate(with: .main)
      
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBOutlet weak var numberOfMergesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.numberOfMergesButton.setTitle(String(PhoneContacts.shared.duplicateContacts.count), for: .normal)
    }
    

    

}
