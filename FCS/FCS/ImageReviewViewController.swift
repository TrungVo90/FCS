//
//  ImageReviewViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 8/7/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import SnapKit

protocol ImageReviewViewProtocol {
    func didFinishChoosingImage(idxRow: Int, image: UIImage)
}

class ImageReviewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var idxCheckList: Int = 0
    var image: UIImage = UIImage()
    
    var dimView: UIView = UIView()
    var closeButton: UIButton = UIButton()
    var takePhotoButton: UIButton = UIButton()
    var photoLibraryButton: UIButton = UIButton()
    
    let imagePicker = UIImagePickerController()
    
    var delegate: ImageReviewViewProtocol?
    
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
        self.dimView.addSubview(self.takePhotoButton)
        self.dimView.addSubview(self.photoLibraryButton)
        
        self.view.backgroundColor = .black
        
        self.imagePicker.delegate = self
        
        self.closeButton.addTarget(self, action: #selector(closeButtonOnClick), for: .touchUpInside)
        self.closeButton.setImage(UIImage(named: "ic_white_close"), for: .normal)
        
        self.takePhotoButton.layer.masksToBounds = true
        self.takePhotoButton.layer.borderColor = UIColor.white.cgColor
        self.takePhotoButton.layer.borderWidth = 2
        self.takePhotoButton.layer.cornerRadius = 10
        self.takePhotoButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        self.takePhotoButton.setTitle("TAKE PHOTO", for: .normal)
        self.takePhotoButton.addTarget(self, action: #selector(takePhotoButtonOnClick), for: .touchUpInside)
        
        self.photoLibraryButton.layer.masksToBounds = true
        self.photoLibraryButton.layer.borderColor = UIColor.white.cgColor
        self.photoLibraryButton.layer.borderWidth = 2
        self.photoLibraryButton.layer.cornerRadius = 10
        self.photoLibraryButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        self.photoLibraryButton.setTitle("CHOOSE FROM LIBRARY", for: .normal)
        self.photoLibraryButton.addTarget(self, action: #selector(photoLibraryButtonOnClick), for: .touchUpInside)
        
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
        
        self.photoLibraryButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-5)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
        
        self.takePhotoButton.snp.remakeConstraints { (make) in
            make.bottom.equalTo(self.photoLibraryButton.snp.top).offset(-5)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.height.equalTo(80)
        }
    }
    
    @objc func closeButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func takePhotoButtonOnClick() {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .camera
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    @objc func photoLibraryButtonOnClick() {
        self.imagePicker.allowsEditing = false
        self.imagePicker.sourceType = .photoLibrary
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.delegate?.didFinishChoosingImage(idxRow: idxCheckList, image: pickedImage)
            self.dismiss(animated: true, completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
}

