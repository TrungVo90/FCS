//
//  ViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/26/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    
    @IBOutlet weak var secondChoiceButton: UIButton!
    
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    @IBOutlet weak var reviewTextView: UITextView!
    
    @IBOutlet weak var imageButton: UIButton!
    
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath)
            as! ChecklistTableViewCell
        
        cell.questionTextView?.text = "This is a question"
        cell.reviewTextView?.text = "User's review"
        
        return cell
    }
    
    
    @IBOutlet weak var completedButton: UIButton!
    
    @IBOutlet weak var checklistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



