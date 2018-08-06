//
//  ChecklistsTableViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 8/5/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import SnapKit

class NewChecklistTableViewCell: UITableViewCell {
    
    var fisrtChoiceButtonTapped : (() -> Void)? = nil
    var secondChoiceButtonTapped : (() -> Void)? = nil
    var thirdChoiceButtonTapped : (() -> Void)? = nil
    var imageButtonTapped : (() -> Void)? = nil
    
    var scrollView = UIScrollView()
    var containerView = UIView()
    
    var _contentView = UIView()
    
    var questionTextView: UITextView = UITextView()
    
    var firstChoiceButton: UIButton = UIButton()
    var secondChoiceButton: UIButton = UIButton()
    var thirdChoiceButton: UIButton = UIButton()
    
    var firstChoiceLabel: UILabel = UILabel()
    var secondChoiceLabel: UILabel = UILabel()
    var thirdChoiceLabel: UILabel = UILabel()
    
    var reviewButton: UIButton = UIButton()
    var reviewTextView: UITextView = UITextView()
    
    var imageButton: UIButton = UIButton()
    var firstImageView: UIImageView = UIImageView()
    var secondImageView: UIImageView = UIImageView()
    var thirdImageView: UIImageView = UIImageView()
    
    var dashedLineView: UIView = UIView()
    
    static var CELL_IDENTIFIER: String = "NewChecklistTableViewCell"
    
    @objc func imageButtonOnClick() {
        if let imageButtonTapped = self.imageButtonTapped {
            imageButtonTapped()
        }
    }
    
    
    @objc func firstChoiceButtonOnClick() {
        if let fisrtChoiceButtonTapped = self.fisrtChoiceButtonTapped {
            fisrtChoiceButtonTapped()
        }
    }
    
    
    @objc func secondChoiceButtonOnClick() {
        if let secondChoiceButtonTapped = self.secondChoiceButtonTapped {
            secondChoiceButtonTapped()
        }
    }
    
    @objc func thirdChoiceButtonOnClick() {
        if let thirdChoiceButtonTapped = self.thirdChoiceButtonTapped {
            thirdChoiceButtonTapped()
        }
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(self.containerView)
        
        self.containerView.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self._contentView)
        self._contentView.addSubview(self.questionTextView)
        
        self._contentView.addSubview(self.firstChoiceButton)
        self._contentView.addSubview(self.secondChoiceButton)
        self._contentView.addSubview(self.thirdChoiceButton)
        
        self._contentView.addSubview(self.firstChoiceLabel)
        self._contentView.addSubview(self.secondChoiceLabel)
        self._contentView.addSubview(self.thirdChoiceLabel)
        
        self._contentView.addSubview(self.reviewButton)
        self._contentView.addSubview(self.imageButton)
        
        self._contentView.addSubview(self.reviewTextView)
        self._contentView.addSubview(self.firstImageView)
        self._contentView.addSubview(self.secondImageView)
        self._contentView.addSubview(self.thirdImageView)
        
        self.containerView.addSubview(self.dashedLineView)
        
        //// Set events
        
        self.firstChoiceButton.addTarget(self, action: #selector(firstChoiceButtonOnClick), for: .touchUpInside)
        self.secondChoiceButton.addTarget(self, action: #selector(firstChoiceButtonOnClick), for: .touchUpInside)
        self.thirdChoiceButton.addTarget(self, action: #selector(firstChoiceButtonOnClick), for: .touchUpInside)
        self.imageButton.addTarget(self, action: #selector(imageButtonOnClick), for: .touchUpInside)

        //// Set color
        
        self.dashedLineView.backgroundColor = .lightGray
        
        self.questionTextView.backgroundColor = .lightGray
        self.questionTextView.text = "This is a question"
        
        self.firstChoiceLabel.text = "1"
        self.firstChoiceLabel.textAlignment = .center
        self.firstChoiceLabel.backgroundColor = .red
        
        self.secondChoiceLabel.text = "2"
        self.secondChoiceLabel.textAlignment = .center
        self.secondChoiceLabel.backgroundColor = .green
        
        self.thirdChoiceLabel.text = "3"
        self.thirdChoiceLabel.textAlignment = .center
        self.thirdChoiceLabel.backgroundColor = .blue
        
        self.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
        self.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
        self.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
        
        self.reviewButton.backgroundColor = .blue
        self.reviewButton.setImage(UIImage(named:"ic_review"), for: .normal)
        
        self.imageButton.backgroundColor = .blue
        self.imageButton.setImage(UIImage(named:"ic_camera"), for: .normal)
        
        self.firstImageView.backgroundColor = .red
        self.secondImageView.backgroundColor = .green
        self.thirdImageView.backgroundColor = .blue
        
        self.reviewTextView.text = "This is a review"
        self.reviewTextView.backgroundColor = .lightGray
    }
    
    func setupLayout() {
        self.containerView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.scrollView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self._contentView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(self.imageButton.snp.bottom)
        }
        
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(125)
        }
        
        self.firstChoiceLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
        }
        
        self.firstChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.firstChoiceLabel.snp.trailing).offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
        }
        
        self.secondChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self._contentView.snp.centerX).offset(-2)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.secondChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._contentView.snp.centerX).offset(3)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.thirdChoiceButton.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
        }
        
        self.thirdChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdChoiceButton.snp.leading).offset(-5)
            make.width.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(5)
        }
        
        self.reviewButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(35)
            make.height.equalTo(35)
            make.top.equalTo(self.firstChoiceButton.snp.bottom).offset(10)
        }
        
        self.imageButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(self.reviewButton.snp.bottom).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(35)
        }
        
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.secondImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.dashedLineView.snp.remakeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    func setupLayoutForAddingComment() {
        self.reviewTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.imageButton.snp.bottom).offset(10)
            make.height.equalTo(250)
        }
    }
}


class ChecklistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var question: [Question] = [Question]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if question[indexPath.row].review == "" {
            return 265
        } else {
            return 525
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewChecklistTableViewCell", for: indexPath)
            as! NewChecklistTableViewCell
        
        cell.questionTextView.text = "This is a question"
        
        if question[indexPath.row].review != "" {
            cell.reviewTextView.text = question[indexPath.row].review
            cell.setupLayoutForAddingComment()
        }
        
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
    
    private var completedButton: UIButton = UIButton()
    
    private var checklistTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
        setupLayout()
        
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
        
        completedButton.layer.masksToBounds = true
        completedButton.layer.borderColor = UIColor.black.cgColor
        completedButton.layer.borderWidth = 2
        completedButton.layer.cornerRadius = 10
        
        completedButton.backgroundColor = .blue
        completedButton.setTitle("Completed", for: .normal)
        
        self.checklistTableView.backgroundColor = UIColor.clear
        self.checklistTableView.separatorStyle = .none
        self.checklistTableView.showsVerticalScrollIndicator = false
        self.checklistTableView.register(NewChecklistTableViewCell.self, forCellReuseIdentifier: NewChecklistTableViewCell.CELL_IDENTIFIER)
        
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "123", imgCaptured: NSData()))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: NSData()))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "123", imgCaptured: NSData()))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: NSData()))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "123", imgCaptured: NSData()))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupView() {
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.completedButton)
        self.view.addSubview(self.backButton)
        self.view.addSubview(self.userInfoButton)
    }
    
    func setupLayout() {
        self.backButton.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(64)
        }
        
        self.userInfoButton.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(64)
        }
        
        self.completedButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.33)
            make.height.equalTo(70)
        }
        
        self.checklistTableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.backButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.completedButton.snp.top).offset(-10)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func completedButtonOnClick() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PreviewChecklistsViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func userInfoButtonOnClick() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
}
