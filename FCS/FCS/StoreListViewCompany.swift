

import Foundation
import UIKit

class StoreListTableViewCell: UITableViewCell {
    @IBOutlet weak var storeImageView: UIImageView!
    
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    
    override func awakeFromNib() {
        storeImageView.layer.borderWidth = 1
        storeImageView.layer.masksToBounds = false
        storeImageView.layer.borderColor = UIColor.white.cgColor
        storeImageView.layer.cornerRadius = storeImageView.frame.height/2
        storeImageView.clipsToBounds = true
    }
}

class StoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    @IBOutlet weak var storeTableView: UITableView!
    var company_id: Int64 = 0
    fileprivate var _branchs = [Branchs]()
    
    @IBOutlet weak var storeSearchBar: UISearchBar!
    
    var filtered: [Branchs] = []
    
    var searchActive : Bool = false
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /// Load list of company on UI
        if let unarchivedObject = UserDefaults.standard.object(forKey: "branchs") as? Data {
            self._branchs = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Branchs])!
        }
        
        /// Filter store based on company id
        self._branchs = self.getListOfBranchsBasedOnCompanyId(companyId: self.company_id)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.storeTableView.delegate = self
        self.storeTableView.dataSource = self
        self.storeSearchBar.delegate = self
    }
    
    private func getListOfBranchsBasedOnCompanyId(companyId: Int64) -> [Branchs] {
        var result = [Branchs]()
        for branch in self._branchs {
            if branch.company_id == companyId {
                result.append(branch)
            }
        }
        return result
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = _branchs.filter({ (branch) -> Bool in
            let tmp: String = branch.name
            let range = tmp.range(of: searchText, options: String.CompareOptions.caseInsensitive)
            return range?.isEmpty == false
        })
        if(filtered.count == 0){
            searchActive = false
        } else {
            searchActive = true
        }
        self.storeTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return self.filtered.count
        }
        return self._branchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeListTableViewCell", for: indexPath)
            as! StoreListTableViewCell
        var branch = self._branchs[indexPath.row]
        if(searchActive){
            branch = filtered[indexPath.row]
        }
        cell.storeNameLabel.text = branch.name
        cell.storeDescription.text = "Address: " + branch.address + " - Phone: " + branch.phone + "\n Email: " + branch.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let vc = CategoryTableViewController()
        let vc = ChecklistsTableViewController()
        vc.companyId = self.company_id
        vc.modalPresentationCapturesStatusBarAppearance = true

        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func userInfoButtonOnClick(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserInfoViewController")
        
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func backButtonOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
