import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var usernametextfield: UITextField!
    @IBOutlet weak var passwordtextfield: UITextField!
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func LoginButton(_ sender: UIButton) {
        print("Username: \(String(describing: usernametextfield.text))")
        print("Password: \(String(describing: passwordtextfield.text))")
        
    }
}




