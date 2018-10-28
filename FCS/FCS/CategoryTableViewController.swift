

import Foundation
import UIKit

class CategoryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var titleLabel: UILabel = UILabel()
    
    var customView: UIView = UIView()
    
    var categories: [Categories] = [Categories]()
    
    var companyQuestions: [CompanyQuestions] = [CompanyQuestions]()
    
    var companyId: Int64 = 0
    
    var listOfQuestionIds: [Int64] = [Int64]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = self.categories[indexPath.row]
        cell.textLabel?.text = category.name
        cell.textLabel?.font = UIFont(name: "Georgia-Bold", size: 12)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let category = self.categories[indexPath.row]
        let vc = ChecklistsTableViewController()
        vc.modalPresentationCapturesStatusBarAppearance = true
        
        filterListOfCompanyQuestionIds(companyId: self.companyId,categoryId: category.id)
        vc.listOfQuestionIds = self.listOfQuestionIds
        self.present(vc, animated: true, completion: nil)
    }
    
    private func filterListOfCompanyQuestionIds(companyId: Int64, categoryId: Int64) {
        self.listOfQuestionIds = [Int64]()
        for q in self.companyQuestions {
            if q.category_id == categoryId && q.company_id == companyId {
                self.listOfQuestionIds.append(q.question_id)
            }
        }
    }
    
    private var categoryTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
        setupLayout()
        
        self.categoryTableView.delegate = self
        self.categoryTableView.dataSource = self
        
        self.categoryTableView.backgroundColor = UIColor.clear
        self.categoryTableView.separatorStyle = .singleLine
        self.categoryTableView.showsVerticalScrollIndicator = false
        self.categoryTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryCell")
        
        /// Load list of category on UI
        if let unarchivedObject = UserDefaults.standard.object(forKey: "categories") as? Data {
            self.categories = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Categories])!
        }
        
        /// Load list of company question
        if let unarchivedObject = UserDefaults.standard.object(forKey: "company_questions") as? Data {
            self.companyQuestions = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [CompanyQuestions])!
        }
        
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
        self.view.addSubview(self.categoryTableView)
        self.view.addSubview(self.customView)
        self.customView.addSubview(self.backButton)
        
        
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
    
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        
        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Category"
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
        
        self.categoryTableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.backButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
}
