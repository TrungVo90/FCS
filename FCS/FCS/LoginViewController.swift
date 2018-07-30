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
    
    @IBAction func loginButtonOnClick(_ sender: Any) {
        //let vc = CompanyListViewController()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyListViewController")

        self.present(vc!, animated: true, completion: nil)
    }
}
