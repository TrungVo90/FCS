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
}

class CompanyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var companyTableView: UITableView!
    
    @IBOutlet weak var userInfoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.companyTableView.delegate = self
        self.companyTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "companyListTableViewCell", for: indexPath)
            as! CompanyListTableViewCell
        cell.companyNameLabel.text = "Lotteria"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StoreListViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
}
