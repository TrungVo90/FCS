//
//  CompanyListViewController.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/29/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class CompanyListTableViewCell: UITableViewCell {
    @IBOutlet weak var companyImageView: UIImageView!
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        companyImageView.layer.borderWidth = 1
        companyImageView.layer.masksToBounds = false
        companyImageView.layer.borderColor = UIColor.white.cgColor
        companyImageView.layer.cornerRadius = companyImageView.frame.height/2
        companyImageView.clipsToBounds = true
    }
}

class CompanyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var companyTableView: UITableView!
    
    @IBOutlet weak var userInfoButton: UIButton!
    
    fileprivate var _companies = [Companies]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.companyTableView.delegate = self
        self.companyTableView.dataSource = self
        
        /// Load list of company on UI
        if let unarchivedObject = UserDefaults.standard.object(forKey: "companies") as? Data {
            self._companies = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Companies])!
        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyListTableViewCell", for: indexPath)
            as! CompanyListTableViewCell
        let company = self._companies[indexPath.row]
        cell.companyNameLabel.text = company.name
        cell.companyDescription.text = company.address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreListViewController") as! StoreListViewController
        let company = self._companies[indexPath.row]
        vc.company_id = company.id
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
