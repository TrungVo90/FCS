//
//  ReviewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 8/7/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import SnapKit

protocol ReviewViewProtocol {
    func didTapDoneButton(idxRow: Int, comment: String)
}

class ReviewViewController: UIViewController {
    
    var idxCheckList: Int = 0
    var lastOffset: CGPoint!
    var keyboardHeight: CGFloat!
    
    var comment: String = ""
    
    var scrollView: UIScrollView = UIScrollView()
    var containerView: UIView = UIView()
    var dimView: UIView = UIView()
    var closeButton: UIButton = UIButton()
    var reviewTextView: UITextView = UITextView()
    var doneButton: UIButton = UIButton()
    var delegate: ReviewViewProtocol?
    
    fileprivate var _isStatusBarHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return self._isStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
        setupLayout()
        
        self._isStatusBarHidden = false
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    func setupViews() {
        self.view.addSubview(self.dimView)
        self.dimView.addSubview(self.closeButton)
        self.dimView.addSubview(self.reviewTextView)
        self.dimView.addSubview(self.doneButton)
        
        self.view.backgroundColor = .black
        
        
        self.reviewTextView.delegate = self
        self.reviewTextView.backgroundColor = .white
        
        
        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        self.closeButton.addTarget(self, action: #selector(closeButtonOnClick), for: .touchUpInside)
        self.closeButton.setImage(UIImage(named: "ic_white_close"), for: .normal)
        
        self.doneButton.layer.masksToBounds = true
        self.doneButton.layer.borderColor = UIColor.white.cgColor
        self.doneButton.layer.borderWidth = 2
        self.doneButton.layer.cornerRadius = 10
        self.doneButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        self.doneButton.setTitle("DONE", for: .normal)
        self.doneButton.addTarget(self, action: #selector(doneButtonOnClick), for: .touchUpInside)
    }
    
    func setupLayout() {
        self.dimView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.closeButton.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-10)
            make.width.equalTo(35)
            make.height.equalTo(35)
        }
        
        self.reviewTextView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.closeButton.snp.bottom).offset(40)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalTo(self.doneButton.snp.top).offset(-10)
        }
    
        self.doneButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-236)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(45)
        }
    }
    
    @objc func closeButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func doneButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
        self.delegate?.didTapDoneButton(idxRow: idxCheckList, comment: self.comment)
    }
}

extension ReviewViewController {
    @objc func keyboardWillShow(notification: NSNotification) {
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {

    }
}

extension ReviewViewController: UITextViewDelegate {
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        lastOffset = self.scrollView.contentOffset
        return true
    }

    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // Your code here
        self.comment = textView.text
    }
    
}
