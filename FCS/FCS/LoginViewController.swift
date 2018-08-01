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
    @IBOutlet weak var loginView: UIView!
    @IBAction func loginButtonOnClick(_ sender: Any) {
        //let vc = CompanyListViewController()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyListViewController")

        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func userProfileButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.layer.masksToBounds = true
        loginView.layer.borderColor = UIColor.black.cgColor
        loginView.layer.borderWidth = 2
        loginView.layer.cornerRadius = 5
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
    }
    
}
