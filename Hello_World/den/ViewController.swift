//
//  ViewController.swift
//  den
//
//  Created by andaç üner on 30.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //label.font = UIFont.systemFont(ofSize: 40)
        //label.textColor = UIColor.red
    }
    
    @IBAction func ButonTap(_ sender: UIButton) {
        
        sender.setTitleColor(UIColor.red, for: UIControl.State.normal)
        label.text = "Hosgeldin!"
    }
    
    

}

