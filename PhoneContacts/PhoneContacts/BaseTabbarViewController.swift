//
//  BaseTabbarViewController.swift
//  PhoneContacts
//
//  Created by Andacuner on 13.06.2022.
//

import UIKit

class BaseTabbarViewController: UITabBarController,Storyboarded {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .orange
        self.tabBar.unselectedItemTintColor = .orange
        // Do any additional setup after loading the view.
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
