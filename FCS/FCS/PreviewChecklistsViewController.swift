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
    
    
    var questionTextView: UITextView = UITextView()
    
    var firstChoiceLabel: UILabel = UILabel()
    
    var secondChoiceLabel: UILabel = UILabel()
    
    var thirdChoiceLabel: UILabel = UILabel()
    
    var firstChoiceButton: UIButton = UIButton()
    
    var secondChoiceButton: UIButton = UIButton()
    
    var thirdChoiceButton: UIButton = UIButton()
    
    var reviewTextView: UITextView = UITextView()
    
    var imageButton: UIButton = UIButton()
}

class PreviewChecklistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var backButon: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var submitButton: UIButton = UIButton()
    
    var previewChecklistTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.previewChecklistTableView.delegate = self
        self.previewChecklistTableView.dataSource = self
        
        self.submitButton.layer.masksToBounds = true
        self.submitButton.layer.borderColor = UIColor.black.cgColor
        self.submitButton.layer.borderWidth = 2
        self.submitButton.layer.cornerRadius = 10
        
        /// add event for submit button
        
        /// add event for back button
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath)
            as! PreviewChecklistTableViewCell
        
        cell.questionTextView.text = "This is a question"
        cell.reviewTextView.text = "User's review"
        return cell
    }
}
