

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak  var indicatorIcon: UIActivityIndicatorView!
    
    @IBOutlet weak  var indicatorView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var tfUsername: UITextField!
    
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBAction func loginButtonOnClick(_ sender: Any) {
        indicatorIcon.isHidden = false
        indicatorView.isHidden = false
        indicatorIcon.startAnimating()
        guard
            let userName = tfUsername.text,
            let password = tfPassword.text
            else
        {
            print("Input info are Null")
            return
        }
        loginWithInfo(userName, password)
        
    }
    
    @IBAction func userProfileButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 2
        loginButton.layer.cornerRadius = 10
        
        indicatorIcon.activityIndicatorViewStyle = .gray
        indicatorIcon.isHidden = true
        indicatorView.isHidden = true
    }
    
    
    private func loginWithInfo(_ username: String , _ password: String) {
        DataManager.sharedInstance.login(username, password) { (data, error) in
            let ACCESS_TOKEN_KEY = "access_token"
            if let error = error {
                print("error calling POST on /todos")
                print(error)
                return
            }
            if let dic: [String: Any] = data {
                let accessToken: String = dic[ACCESS_TOKEN_KEY] as! String
                self.saveLoginDate(accessToken, completionHandler: {
                    self.fetchAllData({
                        DispatchQueue.main.async {
                            print("navigation to company view controller")
                            self.navigationToOtherView()
                        }
                    })
                })
            }
        }
        
    }
    
    private func saveLoginDate(_ accessToken: String, completionHandler: @escaping () -> Void) -> Void {
        print("handle token data")
        let ACCESS_TOKEN_KEY = "access_token"
        if (UserDefaults.standard.object(forKey: ACCESS_TOKEN_KEY) != nil) {
            UserDefaults.standard.removeObject(forKey: ACCESS_TOKEN_KEY)
        }
        UserDefaults.standard.set(accessToken, forKey: ACCESS_TOKEN_KEY)
        UserDefaults.standard.synchronize();
        
        if (UserDefaults.standard.object(forKey: ACCESS_TOKEN_KEY) != nil) {
            print(accessToken)
            completionHandler();
        }
    }
    
    private func fetchAllData(_ completionHandler:  @escaping () -> Void) -> Void {
        print("fetch All Data")
        let dataManager = DataManager.sharedInstance
        dataManager.downloadAllInitialData { (data,error) in
            if let error = error {
                // got an error in getting the data, need to handle it
                print("error calling POST on /todos")
                print(error)
                return
            }
            if let data = data {
                /// Parse JSON data
                let kUserDefault = UserDefaults.standard
                var questions = kUserDefault.array(forKey: "questions")
                var companies = kUserDefault.array(forKey: "companies")
                var branchs = kUserDefault.array(forKey: "branchs")
                var categories = kUserDefault.array(forKey: "question_categories")
                var companyQuestions = kUserDefault.array(forKey: "company_questions")
                var checklists = kUserDefault.array(forKey: "checklist")
                
                questions = self.parseAllQuestions(listOfQuestion: data["questions"] as! [AnyObject])
                companies = self.parseAllCompanies(listOfCompanies: data["companies"] as! [AnyObject])
                branchs = self.parseAllBranchs(listOfBranchs: data["branchs"] as! [AnyObject])
                categories = self.parseAllCategories(listOfCategories: data["question_categories"] as! [AnyObject])
                companyQuestions = self.parseAllCompanyQuestions(listOfCompanyQuestions: data["company_questions"] as! [AnyObject])
                checklists = self.parseAllChecklist(checklists: data["checklist"] as! [AnyObject])
                /// to do parse checklist to store data
                
                /// Store data
                var encodedData = NSKeyedArchiver.archivedData(withRootObject: questions! as NSArray) as NSData
                kUserDefault.set(encodedData, forKey: "questions")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: companies! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "companies")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: branchs! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "branchs")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: categories! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "question_categories")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: companyQuestions! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "company_questions")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: checklists! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "checklist")
                
                kUserDefault.synchronize()
                completionHandler()
            }
            
        }
    }
    
    
    
    fileprivate func parseAllQuestions(listOfQuestion: [AnyObject]) -> [Questions] {
        var questions = [Questions]()
        for q in listOfQuestion {
            let question = Questions()
            question.status = (q["status"] as? Int)!
            question.question_id = (q["id"] as? Int64)!
            question.category_id = (q["category_id"] as? Int64)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var date = dateFormatter.date(from: (q["created_at"] as? String)!)
            
            question.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            question.checklist_id = (q["checklist_id"] as? Int64)!
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)!
            question.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            question.title_vn = (q["title_vn"] as? String)!
            question.title_en = (q["title_en"] as? String)!
            questions.append(question)
        }
        return questions
    }
    
    fileprivate func parseAllCompanies(listOfCompanies: [AnyObject]) -> [Companies] {
        var companies = [Companies]()
        for q in listOfCompanies {
            let company = Companies()
            company.id = (q["id"] as? Int64)!
            company.name = (q["name"] as? String)!
            company.email = (q["email"] as? String)!
            company.auth_key = (q["auth_key"] as? String)!
            company.password_hash = (q["password_hash"] as? String)!
            company.password_reset_token = (q["password_reset_token"] as? String)!
            company.phone = (q["phone"] as? String)!
            company.address = (q["address"] as? String)!
            company.tax_number = (q["tax_number"] as? Int64)!
            company.contract_number = (q["contract_number"] as? String)!
            
            company.status = (q["status"] as? Int)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var date = dateFormatter.date(from: (q["contract_expired"] as? String)!)
            
            company.contract_expired = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            date = dateFormatter.date(from: (q["created_at"] as? String)!)
            company.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)
            company.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            companies.append(company)
        }
        return companies
    }
    
    fileprivate func parseAllBranchs(listOfBranchs: [AnyObject]) -> [Branchs] {
        var branchs = [Branchs]()
        for q in listOfBranchs {
            let branch = Branchs()
            branch.id = (q["id"] as? Int64)!
            branch.company_id = (q["company_id"] as? Int64)!
            branch.name = (q["name"] as? String)!
            branch.email = (q["email"] as? String)!
            branch.phone = (q["phone"] as? String)!
            branch.address = (q["address"] as? String)!
            branch.status = (q["status"] as? Int)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var date = dateFormatter.date(from: (q["created_at"] as? String)!)
            branch.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)
            branch.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            branchs.append(branch)
        }
        return branchs
    }
    
    fileprivate func parseAllCategories(listOfCategories: [AnyObject]) -> [Categories] {
        var categories = [Categories]()
        for q in listOfCategories {
            let category = Categories()
            category.id = (q["id"] as? Int64)!
            category.checklist_id = (q["checklist_id"] as? Int64)!
            category.name = (q["name"] as? String)!
            category.status = (q["status"] as? Int)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            
            var date = dateFormatter.date(from: (q["created_at"] as? String)!)
            category.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)
            category.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            categories.append(category)
        }
        return categories
    }
    
    fileprivate func parseAllCompanyQuestions(listOfCompanyQuestions: [AnyObject]) -> [CompanyQuestions] {
        var companyQuestions = [CompanyQuestions]()
        for q in listOfCompanyQuestions {
            let companyQuestion = CompanyQuestions()
            companyQuestion.status = (q["status"] as? Int)!
            companyQuestion.question_id = (q["question_id"] as? Int64)!
            companyQuestion.category_id = (q["category_id"] as? Int64)!
            companyQuestion.company_id = (q["company_id"] as? Int64)!
            companyQuestion.checklist_id = (q["checklist_id"] as? Int64)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var date = dateFormatter.date(from: (q["created_at"] as? String)!)
            companyQuestion.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)!
            companyQuestion.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            companyQuestions.append(companyQuestion)
        }
        return companyQuestions
    }
    
    fileprivate func parseAllChecklist(checklists: [AnyObject]) -> [Checklist] {
        var listOfChecklists = [Checklist]()
        for q in checklists {
            let checklist = Checklist()
            checklist.id = (q["id"] as? Int64)!
            checklist.name = (q["name"] as? String)!
            checklist.status = (q["status"] as? Int)!
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            
            dateFormatter.calendar = Calendar(identifier: .iso8601)
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
            
            var date = dateFormatter.date(from: (q["created_at"] as? String)!)
            checklist.created_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            date = dateFormatter.date(from: (q["updated_at"] as? String)!)!
            checklist.updated_at = date == nil ? Date(timeIntervalSince1970: 0) : date!
            
            listOfChecklists.append(checklist)
        }
        return listOfChecklists
    }
    
    private func navigationToOtherView() {
        //let vc = CompanyListViewController()
        indicatorIcon.stopAnimating()
        indicatorIcon.isHidden = true
        indicatorView.isHidden = true
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CompanyListViewController")
        self.present(vc!, animated: true, completion: nil)
    }
    
}

