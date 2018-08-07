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
    var reviewButtonTapped : (() -> Void)? = nil
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
    
    @objc func reviewButtonOnClick() {
        if let reviewButtonTapped = self.reviewButtonTapped {
            reviewButtonTapped()
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
        self.secondChoiceButton.addTarget(self, action: #selector(secondChoiceButtonOnClick), for: .touchUpInside)
        self.thirdChoiceButton.addTarget(self, action: #selector(thirdChoiceButtonOnClick), for: .touchUpInside)
        self.reviewButton.addTarget(self, action: #selector(reviewButtonOnClick), for: .touchUpInside)
        self.imageButton.addTarget(self, action: #selector(imageButtonOnClick), for: .touchUpInside)

        //// Set color
        
        self.dashedLineView.backgroundColor = .lightGray
        
        self.questionTextView.text = "Chồng có thương em nhiều không?"
        
        self.firstChoiceLabel.text = "1"
        self.firstChoiceLabel.textAlignment = .center
        self.firstChoiceLabel.font = UIFont(name:"Georgia Bold", size: 20.0)
        self.firstChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.secondChoiceLabel.text = "2"
        self.secondChoiceLabel.textAlignment = .center
        self.secondChoiceLabel.font = UIFont(name:"Georgia Bold", size: 20.0)
        self.secondChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.thirdChoiceLabel.text = "3"
        self.thirdChoiceLabel.textAlignment = .center
        self.thirdChoiceLabel.font = UIFont(name:"Georgia Bold", size: 20.0)
        self.thirdChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
        self.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        self.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        
        self.reviewButton.setImage(UIImage(named:"ic_review"), for: .normal)
        
        self.imageButton.setImage(UIImage(named:"ic_camera"), for: .normal)
        
        self.firstImageView.image = UIImage.init(named: "ic_image")
        self.secondImageView.image = UIImage.init(named: "ic_image")
        self.thirdImageView.image = UIImage.init(named: "ic_image")
        
        self.firstImageView.contentMode = .scaleAspectFit
        self.secondImageView.contentMode = .scaleAspectFit
        self.thirdImageView.contentMode = .scaleAspectFit
        
        
        self.reviewTextView.text = "Chồng trả lời vào đây nha chồng.. ^_^"
        
        /// COnfigure cell
        self.questionTextView.isUserInteractionEnabled = false
        self.questionTextView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.reviewTextView.isUserInteractionEnabled = false
        self.reviewTextView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
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
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.top.equalTo(self.firstChoiceButton.snp.bottom).offset(10)
        }
        
        self.imageButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(self.reviewButton.snp.bottom).offset(0)
            make.height.equalTo(45)
            make.width.equalTo(45)
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
            make.height.equalTo(245)
        }
    }
}


class ChecklistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var titleLabel: UILabel = UILabel()
    
    var customView: UIView = UIView()
    
    var question: [Question] = [Question]()
    
    let imagePicker = UIImagePickerController()
    
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
        
        cell.questionTextView.text = "Chồng có thương em nhiều không?"
        
        if question[indexPath.row].review != "" {
            cell.reviewTextView.text = question[indexPath.row].review
            cell.setupLayoutForAddingComment()
        }
        
        cell.fisrtChoiceButtonTapped = {
            cell.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        }
        
        cell.secondChoiceButtonTapped = {
            cell.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        }
        
        cell.thirdChoiceButtonTapped = {
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        }
        
        cell.reviewButtonTapped = {
            let vc = ReviewViewController()
            vc.idxCheckList = indexPath.row
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.imageButtonTapped = {
            let vc = ImageReviewViewController()
            vc.idxCheckList = indexPath.row
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.firstImageView.image = question[indexPath.row].imgCaptured[0]
        cell.secondImageView.image = question[indexPath.row].imgCaptured[1]
        cell.thirdImageView.image = question[indexPath.row].imgCaptured[2]
        
        
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
        
        self.imagePicker.delegate = self
        
        completedButton.layer.masksToBounds = true
        completedButton.layer.borderColor = UIColor.white.cgColor
        completedButton.layer.borderWidth = 2
        completedButton.layer.cornerRadius = 10
    
        completedButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)

        completedButton.setTitle("Completed", for: .normal)
        
        self.checklistTableView.backgroundColor = UIColor.clear
        self.checklistTableView.separatorStyle = .none
        self.checklistTableView.showsVerticalScrollIndicator = false
        self.checklistTableView.register(NewChecklistTableViewCell.self, forCellReuseIdentifier: NewChecklistTableViewCell.CELL_IDENTIFIER)
        
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: [UIImage](arrayLiteral: UIImage(), UIImage(),UIImage()), numberOfCapturedImg: 0))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: [UIImage](arrayLiteral: UIImage(), UIImage(),UIImage()), numberOfCapturedImg: 0))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: [UIImage](arrayLiteral: UIImage(), UIImage(),UIImage()), numberOfCapturedImg: 0))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: [UIImage](arrayLiteral: UIImage(), UIImage(),UIImage()), numberOfCapturedImg: 0))
        question.append(Question(questionName: "ABC", questionChoice: 1, review: "", imgCaptured: [UIImage](arrayLiteral: UIImage(), UIImage(),UIImage()), numberOfCapturedImg: 0))
        
        
        
    }
    
    fileprivate var _isStatusBarHidden = false

    override var prefersStatusBarHidden: Bool {
        return self._isStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._isStatusBarHidden = false
        self.setNeedsStatusBarAppearanceUpdate()
        
        
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.completedButton)
        self.view.addSubview(self.customView)
        self.customView.addSubview(self.backButton)
//        self.customView.addSubview(self.userInfoButton)
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
//        self.userInfoButton.setImage(UIImage(named: "ic_user"), for: .normal)
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        self.completedButton.addTarget(self, action: #selector(completedButtonOnClick), for: .touchUpInside)
//        self.userInfoButton.addTarget(self, action: #selector(userInfoButtonOnClick), for: .touchUpInside)
        
        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Check lists"
        self.titleLabel.textAlignment = .center
    }
    
    func setupLayout() {
        self.customView.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(31)
            make.leading.equalToSuperview()
            make.height.equalTo(44)
            make.trailing.equalToSuperview()
        }
        
        self.backButton.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(44)
        }
        
        self.titleLabel.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview()
        }
//
//        self.userInfoButton.snp.remakeConstraints { (make) in
//            make.top.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.height.equalToSuperview()
//            make.width.equalTo(44)
//        }
        
        self.completedButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
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

    @objc func completedButtonOnClick() {
        let vc = PreviewChecklistsTableViewController()
        vc.modalPresentationCapturesStatusBarAppearance = true
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func userInfoButtonOnClick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

extension ChecklistsTableViewController: ReviewViewProtocol {
    func didTapDoneButton(idxRow: Int, comment: String) {
        question[idxRow].review = comment
        self.checklistTableView.reloadData()
    }
}

extension ChecklistsTableViewController: ImageReviewViewProtocol {
    func didFinishChoosingImage(idxRow: Int, image: UIImage) {
        let idx = question[idxRow].numberOfCapturedImg
        question[idxRow].imgCaptured[idx % 3] = image
        question[idxRow].numberOfCapturedImg = (question[idxRow].numberOfCapturedImg + 1) % 3
        self.checklistTableView.reloadData()
    }
}

