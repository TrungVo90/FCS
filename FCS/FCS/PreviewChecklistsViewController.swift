//
//  PreviewChecklistsViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/28/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class PreviewChecklistsViewController: UIViewController {
    @IBOutlet weak var backButon: UIButton!
    
    @IBOutlet weak var userInfoButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var previewChecklistTableView: UITableView!
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonOnClick(_ sender: Any) {
        
    }
}
