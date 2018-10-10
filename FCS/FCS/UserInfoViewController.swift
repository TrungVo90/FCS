

import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonTouch(_ sender: Any) {
        self.dismiss(animated: true) {
            print("dismiss User Profile view")
            let ACCESS_TOKEN_KEY = "access_token"
            
            if (UserDefaults.standard.object(forKey: ACCESS_TOKEN_KEY) != nil) {
                UserDefaults.standard.removeObject(forKey: ACCESS_TOKEN_KEY)
            }
            self.postLogoutNotification()
        }
    }
    
    func postLogoutNotification() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Logout"), object: nil, userInfo: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logOutBtn.layer.masksToBounds = true
        self.logOutBtn.layer.borderColor = UIColor.white.cgColor
        self.logOutBtn.layer.borderWidth = 2
        self.logOutBtn.layer.cornerRadius = 10
    }
}
