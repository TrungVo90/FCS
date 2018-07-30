//
//  PreviewChecklistsViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/28/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class PreviewChecklistTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    
    @IBOutlet weak var secondChoiceButton: UIButton!
    
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBOutlet weak var imageButton: UIButton!
}

class PreviewChecklistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var backButon: UIButton!
    
    @IBOutlet weak var userInfoButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var previewChecklistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.previewChecklistTableView.delegate = self
        self.previewChecklistTableView.dataSource = self
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonOnClick(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "previewChecklistTableViewCell", for: indexPath)
            as! PreviewChecklistTableViewCell
        
        cell.questionTextView?.text = "This is a question"
        cell.reviewTextView?.text = "User's review"
        return cell
    }
}
