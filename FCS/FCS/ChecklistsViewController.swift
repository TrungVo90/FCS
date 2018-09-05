

import UIKit

class ChecklistTableViewCell: UITableViewCell {
    
    var fisrtChoiceButtonTapped : (() -> Void)? = nil
    var secondChoiceButtonTapped : (() -> Void)? = nil
    var thirdChoiceButtonTapped : (() -> Void)? = nil
    var imageButtonTapped : (() -> Void)? = nil
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    
    @IBOutlet weak var secondChoiceButton: UIButton!
    
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    @IBOutlet weak var reviewButton: UIButton!
    
    @IBOutlet weak var imageButton: UIButton!
    
   
    @IBAction func imageButtonOnClick(_ sender: Any) {
        if let imageButtonTapped = self.imageButtonTapped {
            imageButtonTapped()
        }
    }
    
    
    @IBAction func firstChoiceButtonOnClick(_ sender: Any) {
        if let fisrtChoiceButtonTapped = self.fisrtChoiceButtonTapped {
            fisrtChoiceButtonTapped()
        }
    }
    
    
    @IBAction func secondChoiceButtonOnClick(_ sender: Any) {
        if let secondChoiceButtonTapped = self.secondChoiceButtonTapped {
            secondChoiceButtonTapped()
        }
    }
    
    @IBAction func thirdChoiceButtonOnClick(_ sender: Any) {
        if let thirdChoiceButtonTapped = self.thirdChoiceButtonTapped {
            thirdChoiceButtonTapped()
        }
    }
    
}

struct Question {
    var questionName: String
    var questionChoice: Int
    var review: String
    var imgCaptured: [UIImage]
    var numberOfCapturedImg: Int
    var latestImage: UIImage
    var heightOfComment: CGFloat
}


class ChecklistsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backButon: UIButton!
    
    @IBOutlet weak var userInfoButton: UIButton!
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 333
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableViewCell", for: indexPath)
            as! ChecklistTableViewCell
        
        cell.questionTextView?.text = "This is a question"
    
        
        cell.fisrtChoiceButtonTapped = {
            cell.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            //cell.firstChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)

            cell.secondChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            //cell.secondChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)

            cell.thirdChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            //cell.thirdChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
        }
        
        cell.secondChoiceButtonTapped = {
            cell.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.secondChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
            
            cell.firstChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            cell.firstChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
            
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            cell.thirdChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
        }
        
        cell.thirdChoiceButtonTapped = {
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.thirdChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
            
            cell.firstChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            cell.firstChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
            
            cell.secondChoiceButton.setImage(UIImage(named:"ic_uncheck"), for: .normal)
            cell.secondChoiceButton.imageEdgeInsets = UIEdgeInsetsMake(1,1,1,1)
        }
        
        
        return cell
    }
    
    
    
    
    @IBOutlet weak var completedButton: UIButton!
    
    @IBOutlet weak var checklistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
        
        completedButton.layer.masksToBounds = true
        completedButton.layer.borderColor = UIColor.black.cgColor
        completedButton.layer.borderWidth = 2
        completedButton.layer.cornerRadius = 10
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func completedButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewChecklistsViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
}



