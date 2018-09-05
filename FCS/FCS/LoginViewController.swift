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
    @IBOutlet weak  var indicatorIcon: UIActivityIndicatorView!
    
     @IBOutlet weak  var indicatorView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var tfUsername: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func loginButtonOnClick(_ sender: Any) {
        indicatorIcon.isHidden = false
        indicatorView.isHidden = false
        indicatorIcon.startAnimating()
        guard
            let userName = tfUsername.text,
            let password = tfPassword.text
        else
        {
            print("Input info are Null")
          return
        }
         loginWithInfo(userName, password)
        
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
        
        indicatorIcon.activityIndicatorViewStyle = .gray
        indicatorIcon.isHidden = true
        indicatorView.isHidden = true
    }
    
   
    private func loginWithInfo(_ username: String , _ password: String) {
        let ACCESS_TOKEN_KEY = "access_token"
        DataManager.sharedInstance.login(username, password) { (data, error) in
    
            if let error = error {
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
                }
                DispatchQueue.main.async {
                    print("navigation to company view controller")
                    self.navigationToOtherView()
                }
                
            }
        }
       
    }
    
    private func navigationToOtherView() {
        //let vc = CompanyListViewController()
        indicatorIcon.stopAnimating()
        indicatorIcon.isHidden = true
        indicatorView.isHidden = true

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyListViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
