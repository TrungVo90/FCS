//
//  UserInfoViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/28/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var address: UILabel!
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
