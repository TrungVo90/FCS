//
//  DataManager.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 8/20/18.
//  Copyright © 2018 Home. All rights reserved.

import Foundation
import UIKit
let HOST: String = "http://35.225.247.85/"
let DOMAIN: String = "product/fcsapp/demo/fcsapp/api/web/index.php/"

enum BackendError: Error {
    case urlError(reason: String)
    case objectSerialization(reason: String)
}

struct GeneralData {
    var status: [String:AnyObject] = [String:AnyObject]()
    var data: [String:AnyObject] = [String:AnyObject]()
    init?(json: [String: Any]) {
        guard let status = json["status"] as? [String:AnyObject],
            let data = json["data"] as? [String:AnyObject] else {
                return nil
        }
        self.status = status
        self.data = data
    }
}

class Companies:  NSObject, NSCoding {
    var id: Int64 = 0
    var name = ""
    var email = ""
    var auth_key = ""
    var password_hash = ""
    var password_reset_token = ""
    var phone = ""
    var address = ""
    var tax_number: Int64 = 0
    var contract_number = ""
    var contract_expired: Date = Date()
    var status: Int = 0
    var created_at: Date = Date()
    var updated_at: Date = Date()
    
    override init() {
        self.id = 0
        self.name = ""
        self.email = ""
        self.auth_key = ""
        self.password_hash = ""
        self.password_reset_token = ""
        self.phone = ""
        self.address = ""
        self.tax_number = 0
        self.contract_number = ""
        self.contract_expired = Date(timeIntervalSince1970: 0)
        self.status = 0
        self.created_at = Date(timeIntervalSince1970: 0)
        self.updated_at = Date(timeIntervalSince1970: 0)
    }
    
    init(id: Int64, name: String, email: String, auth_key: String, password_hash: String = "",
         password_reset_token: String = "", phone: String = "", address: String = "", tax_number: Int64 = 0, contract_number: String = "", contract_expired: Date = Date(timeIntervalSince1970: 0), status: Int = 0, created_at: Date = Date(timeIntervalSince1970: 0), updated_at: Date = Date(timeIntervalSince1970: 0)) {
        self.id = id
        self.name = name
        self.email = email
        self.auth_key = auth_key
        self.password_hash = password_hash
        self.password_reset_token = password_reset_token
        self.phone = phone
        self.address = address
        self.tax_number = tax_number
        self.contract_number = contract_number
        self.contract_expired = contract_expired
        self.status = status
        self.created_at = created_at
        self.updated_at = updated_at
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInt64(forKey: "id")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        let auth_key = aDecoder.decodeObject(forKey: "auth_key") as! String
        let password_hash = aDecoder.decodeObject(forKey: "password_hash") as! String
        let password_reset_token = aDecoder.decodeObject(forKey: "password_reset_token") as! String
        let phone = aDecoder.decodeObject(forKey: "phone") as! String
        let address = aDecoder.decodeObject(forKey: "address") as! String
        let tax_number = aDecoder.decodeInt64(forKey: "tax_number")
        
        let contract_number = aDecoder.decodeObject(forKey: "contract_number") as! String
        let contract_expired = aDecoder.decodeObject(forKey: "contract_expired") as! Date
        let status = aDecoder.decodeInteger(forKey: "status")
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! Date
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! Date
        self.init(id: id, name: name, email: email, auth_key: auth_key, password_hash: password_hash, password_reset_token: password_reset_token, phone: phone, address: address, tax_number: tax_number, contract_number: contract_number, contract_expired: contract_expired, status: status, created_at: created_at, updated_at: updated_at)
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.auth_key, forKey: "auth_key")
        aCoder.encode(self.password_hash, forKey: "password_hash")
        aCoder.encode(self.password_reset_token, forKey: "password_reset_token")
        aCoder.encode(self.phone, forKey: "phone")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.tax_number, forKey: "tax_number")
        aCoder.encode(self.contract_number, forKey: "contract_number")
        aCoder.encode(self.contract_expired, forKey: "contract_expired")
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.created_at, forKey: "created_at")
        aCoder.encode(self.updated_at, forKey: "updated_at")
    }
    
    
}

class Branchs: NSObject, NSCoding {
    var id: Int64 = 0
    var company_id: Int64 = 0
    var name = ""
    var email = ""
    var phone = ""
    var address = ""
    var status = 0
    var created_at: Date = Date()
    var updated_at: Date = Date()
    
    override init() {
        self.id = 0
        self.company_id = 0
        self.name = ""
        self.phone = ""
        self.email = ""
        self.address = ""
        self.status = 0
        self.created_at = Date(timeIntervalSince1970: 0)
        self.updated_at = Date(timeIntervalSince1970: 0)
    }
    
    init(id: Int64, company_id: Int64 = 0, name: String, email: String, phone: String = "", address: String = "", status: Int = 0, created_at: Date = Date(timeIntervalSince1970: 0), updated_at: Date = Date(timeIntervalSince1970: 0)) {
        self.id = id
        self.company_id = company_id
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        self.status = status
        self.created_at = created_at
        self.updated_at = updated_at
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInt64(forKey: "id")
        let company_id = aDecoder.decodeInt64(forKey: "company_id")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        let phone = aDecoder.decodeObject(forKey: "phone") as! String
        let address = aDecoder.decodeObject(forKey: "address") as! String
        let status = aDecoder.decodeInteger(forKey: "status")
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! Date
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! Date
        self.init(id: id, company_id: company_id, name: name, email: email, phone: phone, address: address, status: status, created_at: created_at, updated_at: updated_at)
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.company_id, forKey: "company_id")
        aCoder.encode(self.phone, forKey: "phone")
        aCoder.encode(self.address, forKey: "address")
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.created_at, forKey: "created_at")
        aCoder.encode(self.updated_at, forKey: "updated_at")
    }
    
}

class Categories: NSObject, NSCoding {
    var id: Int64 = 0
    var checklist_id: Int64 = 0
    var name = ""
    var status = 0
    var created_at: Date = Date()
    var updated_at: Date = Date()
    
    override init() {
        self.id = 0
        self.checklist_id = 0
        self.name = ""
        self.status = 0
        self.created_at = Date(timeIntervalSince1970: 0)
        self.updated_at = Date(timeIntervalSince1970: 0)
        
    }
    
    init(id: Int64, checklist_id: Int64 = 0, name: String, status: Int = 0, created_at: Date = Date(timeIntervalSince1970: 0), updated_at: Date = Date(timeIntervalSince1970: 0)) {
        self.id = id
        self.checklist_id = checklist_id
        self.name = name
        self.status = status
        self.created_at = created_at
        self.updated_at = updated_at
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeInt64(forKey: "id")
        let checklist_id = aDecoder.decodeInt64(forKey: "checklist_id")
        let name = aDecoder.decodeObject(forKey: "name") as! String
        
        let status = aDecoder.decodeInteger(forKey: "status")
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! Date
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! Date
        self.init(id: id, checklist_id: checklist_id, name: name, status: status, created_at: created_at, updated_at: updated_at)
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.checklist_id, forKey: "checklist_id")
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.created_at, forKey: "created_at")
        aCoder.encode(self.updated_at, forKey: "updated_at")
    }
}

class Questions: NSObject, NSCoding {
    var company_id: Int64 = 0
    var checklist_id: Int64 = 0
    var category_id: Int64 = 0
    var question_id: Int64 = 0
    var status = 0
    var created_at: Date = Date()
    var updated_at: Date = Date()
    var title_vn: String = ""
    var title_en: String = ""
    
    var questionChoice: Int = 0
    var review: String = ""
    var imgCaptured: [UIImage] = [UIImage]()
    var numberOfCapturedImg: Int = 0
    var latestImage: UIImage = UIImage()
    var heightOfComment: CGFloat = 0.0
    var heightOfQuestion: CGFloat = 0.0
    
    override init() {
        self.company_id = 0
        self.checklist_id = 0
        self.category_id = 0
        self.question_id = 0
        self.status = 0
        self.created_at = Date(timeIntervalSince1970: 0)
        self.updated_at = Date(timeIntervalSince1970: 0)
        self.title_vn = ""
        self.title_en = ""
        
        /// Addtional properties
        self.questionChoice = 0
        self.review = ""
        self.imgCaptured = [UIImage]()
        self.imgCaptured.append(UIImage())
        self.imgCaptured.append(UIImage())
        self.imgCaptured.append(UIImage())
        
        self.numberOfCapturedImg = 0
        self.latestImage = UIImage()
        self.heightOfComment = 0.0
        self.heightOfQuestion = 0.0
    }
    
    init(company_id: Int64, checklist_id: Int64 = 0, category_id: Int64, question_id: Int64, status: Int = 0, created_at: Date = Date(timeIntervalSince1970: 0), updated_at: Date = Date(timeIntervalSince1970: 0), title_vn: String = "", title_en: String = "") {
        self.company_id = company_id
        self.checklist_id = checklist_id
        self.category_id = category_id
        self.question_id = question_id
        self.status = status
        self.created_at = created_at
        self.updated_at = updated_at
        self.title_en = title_en
        self.title_vn = title_vn
        
        /// Addtional properties
        self.questionChoice = 0
        self.review = ""
        self.imgCaptured = [UIImage]()
        self.imgCaptured.append(UIImage())
        self.imgCaptured.append(UIImage())
        self.imgCaptured.append(UIImage())
        
        self.numberOfCapturedImg = 0
        self.latestImage = UIImage()
        self.heightOfComment = 0.0
        self.heightOfQuestion = 0.0
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let company_id = aDecoder.decodeInt64(forKey: "company_id")
        let checklist_id = aDecoder.decodeInt64(forKey: "checklist_id")
        let category_id = aDecoder.decodeInt64(forKey: "category_id")
        let question_id = aDecoder.decodeInt64(forKey: "question_id")
        
        let status = aDecoder.decodeInteger(forKey: "status")
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! Date
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! Date
        
        let title_vn = aDecoder.decodeObject(forKey: "title_vn") as! String
        let title_en = aDecoder.decodeObject(forKey: "title_en") as! String
        
        
        self.init(company_id: company_id, checklist_id: checklist_id, category_id: category_id, question_id: question_id, status: status, created_at: created_at, updated_at: updated_at, title_vn: title_vn, title_en: title_en)
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.company_id, forKey: "company_id")
        aCoder.encode(self.checklist_id, forKey: "checklist_id")
        aCoder.encode(self.category_id, forKey: "category_id")
        aCoder.encode(self.question_id, forKey: "question_id")
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.created_at, forKey: "created_at")
        aCoder.encode(self.updated_at, forKey: "updated_at")
        aCoder.encode(self.title_vn, forKey: "title_vn")
        aCoder.encode(self.title_en, forKey: "title_en")
    }
}

class CompanyQuestions: NSObject, NSCoding {

    var company_id: Int64 = 0
    var checklist_id: Int64 = 0
    var category_id: Int64 = 0
    var question_id: Int64 = 0
    var status = 0
    var created_at: Date = Date()
    var updated_at: Date = Date()
    
    override init() {
        self.company_id = 0
        self.checklist_id = 0
        self.category_id = 0
        self.question_id = 0
        self.status = 0
        self.created_at = Date(timeIntervalSince1970: 0)
        self.updated_at = Date(timeIntervalSince1970: 0)
    }
    
    init(company_id: Int64, checklist_id: Int64 = 0, category_id: Int64, question_id: Int64, status: Int = 0, created_at: Date = Date(timeIntervalSince1970: 0), updated_at: Date = Date(timeIntervalSince1970: 0)) {
        self.company_id = company_id
        self.checklist_id = checklist_id
        self.category_id = category_id
        self.question_id = question_id
        self.status = status
        self.created_at = created_at
        self.updated_at = updated_at
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let company_id = aDecoder.decodeInt64(forKey: "company_id")
        let checklist_id = aDecoder.decodeInt64(forKey: "checklist_id")
        let category_id = aDecoder.decodeInt64(forKey: "category_id")
        let question_id = aDecoder.decodeInt64(forKey: "question_id")
        
        let status = aDecoder.decodeInteger(forKey: "status")
        let created_at = aDecoder.decodeObject(forKey: "created_at") as! Date
        let updated_at = aDecoder.decodeObject(forKey: "updated_at") as! Date
        
        self.init(company_id: company_id, checklist_id: checklist_id, category_id: category_id, question_id: question_id, status: status, created_at: created_at, updated_at: updated_at)
    }
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.company_id, forKey: "company_id")
        aCoder.encode(self.checklist_id, forKey: "checklist_id")
        aCoder.encode(self.category_id, forKey: "category_id")
        aCoder.encode(self.question_id, forKey: "question_id")
        aCoder.encode(self.status, forKey: "status")
        aCoder.encode(self.created_at, forKey: "created_at")
        aCoder.encode(self.updated_at, forKey: "updated_at")
    }
}

open class DataManager: NSObject, Codable {
    
    let ACCESS_TOKEN_KEY = "access_token"
    static let sharedInstance = DataManager()
    func downloadAllInitialData(completionHandler: @escaping ([String:AnyObject]?, Error?) -> Void) {
        let urlString =  HOST + DOMAIN + "init"
        guard let url = URL(string: urlString) else {
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PATCH"
        var headers = urlRequest.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        urlRequest.allHTTPHeaderFields = headers
        
        if let token = UserDefaults.standard.object(forKey:ACCESS_TOKEN_KEY ) {
            urlRequest.setValue(token as! String, forHTTPHeaderField: "Authorization")
        }
        
        let encoder = JSONEncoder()
        do {
            let asJSON = try encoder.encode(self)
            urlRequest.httpBody = asJSON
            // See if it's right
            if let bodyData = urlRequest.httpBody {
                print(String(data: bodyData, encoding: .utf8) ?? "no body data")
            }
        } catch {
            print(error)
            completionHandler(nil,error)
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                let error = error!
                completionHandler(nil, error)
                return
            }
            guard let responseData = data else {
                let error = BackendError.objectSerialization(reason: "No data in response")
                completionHandler(nil,error)
                return
            }
            
            // parse the result as JSON
            // then create a Todo from the JSON
            do {
                if let generalDataJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any],let generalData = GeneralData(json: generalDataJSON) {
                    // created a TODO object
                    
                    completionHandler(generalData.data,nil)
                } else {
                    // couldn't create a todo object from the JSON
                    let error = BackendError.objectSerialization(reason: "Couldn't create a todo object from the JSON")
                    completionHandler(nil, error)
                }
            } catch {
                // error trying to convert the data to JSON using JSONSerialization.jsonObject
                completionHandler(nil, error)
                return
            }
        }
        
        task.resume()
    }
    
    func login(_ username: String , _ password: String, completionHandler: @escaping ([String:AnyObject]?, Error?) -> Void) -> Void {
        let urlString =  HOST + DOMAIN + "login"
        guard let url = URL(string: urlString) else {
            let error = BackendError.urlError(reason: "Could not construct URL")
            completionHandler(nil, error)
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        var headers = urlRequest.allHTTPHeaderFields ?? [:]
        headers["Content-Type"] = "application/json"
        urlRequest.allHTTPHeaderFields = headers
        
        let parameters = ["username": username, "password": password] as [String : String]
        do {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) {
            (data, response, error) in
            guard error == nil else {
                let error = error!
                completionHandler(nil, error)
                return
            }
            guard let responseData = data else {
                let error = BackendError.objectSerialization(reason: "No data in response")
                completionHandler(nil,error)
                return
            }
            
            // parse the result as JSON
            // then create a Todo from the JSON
            do {
                if let generalDataJSON = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any],let generalData = GeneralData(json: generalDataJSON) {
                    // created a TODO object
                    
                    completionHandler(generalData.data,nil)
                } else {
                    // couldn't create a todo object from the JSON
                    let error = BackendError.objectSerialization(reason: "Couldn't create a todo object from the JSON")
                    completionHandler(nil, error)
                }
            } catch {
                // error trying to convert the data to JSON using JSONSerialization.jsonObject
                completionHandler(nil, error)
                return
            }
        }
        task.resume()
    }
}


