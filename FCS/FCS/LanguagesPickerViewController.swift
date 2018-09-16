//
//  LanguagesPickerViewController.swift
//  FCS
//
//  Created by Nguyen Mong Thuong on 9/16/18.
//  Copyright © 2018 Home. All rights reserved.
//

import Foundation
import UIKit

protocol LanguagesPickerDelegate {
    func selectedLanguage(_ lang: String)
}

class LanguagesPickerViewController: UITableViewController  {
    
    var delegate:LanguagesPickerDelegate?
    let langs = ["Vi","En"]
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return langs.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedLanguage(langs[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
    
        cell.textLabel?.text = langs[indexPath.row];
        return cell
    }
   
}



