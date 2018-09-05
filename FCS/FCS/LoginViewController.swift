//
//  LoginViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/28/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonOnClick(_ sender: Any) {
        login()
    }
    
    @IBAction func userProfileButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
    }
    
    private func login() {
        let ACCESS_TOKEN_KEY = "access_token"
        DataManager.sharedInstance.login { (data, error) in
            if let error = error {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos")
                print(error)
                return
            }
            if let dic: [String: Any] = data {
                DispatchQueue.global(qos: .background).async {
                    print("handle login data")
                    let accessToken = dic[ACCESS_TOKEN_KEY]
                    
                    if (UserDefaults.standard.object(forKey: ACCESS_TOKEN_KEY) != nil) {
                        UserDefaults.standard.removeObject(forKey: ACCESS_TOKEN_KEY)
                    }
                    UserDefaults.standard.set(accessToken, forKey: ACCESS_TOKEN_KEY)
                    UserDefaults.standard.synchronize();
                    print(accessToken ?? "")
                    
                    DispatchQueue.main.async {
                        print("navigation to company view controller")
                        self.navigationToOtherView()
                    }
                }

                
            }
        }
    }
    
    private func navigationToOtherView() {
        //let vc = CompanyListViewController()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyListViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
