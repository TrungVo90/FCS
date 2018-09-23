//
//  DetailStoreViewController.swift
//  FCS
//
//  Created by Nguyen Mong Thuong on 9/21/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

class DetailStoreTableViewCell: UITableViewCell {
    static var CELL_IDENTIFIER: String = "detailStoreTableViewCell"
    
    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    
    
    override func awakeFromNib() {
        storeImg.layer.borderWidth = 1
        storeImg.layer.masksToBounds = false
        storeImg.layer.borderColor = UIColor.white.cgColor
        storeImg.layer.cornerRadius = storeImg.frame.height/2
        storeImg.clipsToBounds = true
        
        storeName.text = "storeName"
        storeDescription.text = "detail store name"
    }
}

class DetailStoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var detailStoreTableView: UITableView!
    
    
    override func viewDidLoad() {
        detailStoreTableView.delegate = self
        detailStoreTableView.dataSource = self
        //        detailStoreTableView.register(DetailStoreTableViewCell.self, forCellReuseIdentifier: DetailStoreTableViewCell.CELL_IDENTIFIER )
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailStoreTableViewCell.CELL_IDENTIFIER, for: indexPath)
            as! DetailStoreTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selectedd index = \(indexPath.row)")
    }
    
    @IBAction func backButtonTouch(_ sender: Any) {
        self.dismiss(animated: true) {
            print("dismiss detail view controller")
        }
    }
    
}





