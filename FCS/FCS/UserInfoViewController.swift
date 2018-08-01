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
    
    @IBOutlet weak var profileView: UIView!
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.layer.masksToBounds = true
        profileView.layer.borderColor = UIColor.black.cgColor
        profileView.layer.borderWidth = 2
        profileView.layer.cornerRadius = 5
    }
}
