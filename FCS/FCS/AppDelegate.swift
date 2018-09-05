//
//  AppDelegate.swift
//  FCS
//
//  Created by Mr Trung Vo Thien Trung on 7/26/18.
//  Copyright © 2018 Home. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window?.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        fetchAllData()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "FCS")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    private func fetchAllData() {
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
                var categories = kUserDefault.array(forKey: "categories")
                var companyQuestions = kUserDefault.array(forKey: "company_questions")
                
                questions = self.parseAllQuestions(listOfQuestion: data["questions"] as! [AnyObject])
                companies = self.parseAllCompanies(listOfCompanies: data["companies"] as! [AnyObject])
                branchs = self.parseAllBranchs(listOfBranchs: data["branchs"] as! [AnyObject])
                categories = self.parseAllCategories(listOfCategories: data["categories"] as! [AnyObject])
                companyQuestions = self.parseAllCompanyQuestions(listOfCompanyQuestions: data["company_questions"] as! [AnyObject])
                
                /// Store data
                var encodedData = NSKeyedArchiver.archivedData(withRootObject: questions! as NSArray) as NSData
                kUserDefault.set(encodedData, forKey: "questions")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: companies! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "companies")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: branchs! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "branchs")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: categories! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "categories")
                encodedData = NSKeyedArchiver.archivedData(withRootObject: companyQuestions! as Array) as NSData
                kUserDefault.set(encodedData, forKey: "company_questions")
                
                kUserDefault.synchronize()
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
    

}

