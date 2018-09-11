

import Foundation
import SnapKit

class NewChecklistTableViewCell: UITableViewCell {
    
    var fisrtChoiceButtonTapped : (() -> Void)? = nil
    var secondChoiceButtonTapped : (() -> Void)? = nil
    var thirdChoiceButtonTapped : (() -> Void)? = nil
    var reviewButtonTapped : (() -> Void)? = nil
    var imageButtonTapped : (() -> Void)? = nil
    
    var scrollView = UIScrollView()
    var containerView = UIView()
    
    var _contentView = UIView()
    
    var questionTextView: UITextView = UITextView()
    
    var firstChoiceButton: UIButton = UIButton()
    var secondChoiceButton: UIButton = UIButton()
    var thirdChoiceButton: UIButton = UIButton()
    
    var firstChoiceLabel: UILabel = UILabel()
    var secondChoiceLabel: UILabel = UILabel()
    var thirdChoiceLabel: UILabel = UILabel()
    
    var reviewButton: UIButton = UIButton()
//    var reviewTextView: UITextView = UITextView()
    
    var reviewTextView: UILabel = UILabel()
    
    var imageButton: UIButton = UIButton()
    var firstImageView: UIImageView = UIImageView()
    var secondImageView: UIImageView = UIImageView()
    var thirdImageView: UIImageView = UIImageView()
    
    var dashedLineView: UIView = UIView()
    
    var heightOfReviewLabel: CGFloat = 0
    
    static var CELL_IDENTIFIER: String = "NewChecklistTableViewCell"
    
    @objc func imageButtonOnClick() {
        if let imageButtonTapped = self.imageButtonTapped {
            imageButtonTapped()
        }
    }
    
    
    @objc func firstChoiceButtonOnClick() {
        if let fisrtChoiceButtonTapped = self.fisrtChoiceButtonTapped {
            fisrtChoiceButtonTapped()
        }
    }
    
    
    @objc func secondChoiceButtonOnClick() {
        if let secondChoiceButtonTapped = self.secondChoiceButtonTapped {
            secondChoiceButtonTapped()
        }
    }
    
    @objc func thirdChoiceButtonOnClick() {
        if let thirdChoiceButtonTapped = self.thirdChoiceButtonTapped {
            thirdChoiceButtonTapped()
        }
    }
    
    @objc func reviewButtonOnClick() {
        if let reviewButtonTapped = self.reviewButtonTapped {
            reviewButtonTapped()
        }
    }
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(self.containerView)
        
        self.containerView.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self._contentView)
        self._contentView.addSubview(self.questionTextView)
        
        self._contentView.addSubview(self.firstChoiceButton)
        self._contentView.addSubview(self.secondChoiceButton)
        self._contentView.addSubview(self.thirdChoiceButton)
        
        self._contentView.addSubview(self.firstChoiceLabel)
        self._contentView.addSubview(self.secondChoiceLabel)
        self._contentView.addSubview(self.thirdChoiceLabel)
        
        self._contentView.addSubview(self.reviewButton)
        self._contentView.addSubview(self.imageButton)
        
        self._contentView.addSubview(self.reviewTextView)
        self._contentView.addSubview(self.firstImageView)
        self._contentView.addSubview(self.secondImageView)
        self._contentView.addSubview(self.thirdImageView)
        
        self.containerView.addSubview(self.dashedLineView)
        
        //// Set events
        
        self.firstChoiceButton.addTarget(self, action: #selector(firstChoiceButtonOnClick), for: .touchUpInside)
        self.secondChoiceButton.addTarget(self, action: #selector(secondChoiceButtonOnClick), for: .touchUpInside)
        self.thirdChoiceButton.addTarget(self, action: #selector(thirdChoiceButtonOnClick), for: .touchUpInside)
        self.reviewButton.addTarget(self, action: #selector(reviewButtonOnClick), for: .touchUpInside)
        self.imageButton.addTarget(self, action: #selector(imageButtonOnClick), for: .touchUpInside)

        //// Set color
        
        self.dashedLineView.backgroundColor = .lightGray
        
        self.questionTextView.text = "Question 1?"
        
        self.firstChoiceLabel.text = "1"
        self.firstChoiceLabel.textAlignment = .center
        self.firstChoiceLabel.font = UIFont(name: "Georgia-Bold", size: 20.0)
        self.firstChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.secondChoiceLabel.text = "2"
        self.secondChoiceLabel.textAlignment = .center
        self.secondChoiceLabel.font = UIFont(name: "Georgia-Bold", size: 20.0)
        self.secondChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.thirdChoiceLabel.text = "3"
        self.thirdChoiceLabel.textAlignment = .center
        self.thirdChoiceLabel.font = UIFont(name: "Georgia-Bold", size: 20.0)
        self.thirdChoiceLabel.font = UIFont.systemFont(ofSize: 20.0)
        
        self.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
        self.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        self.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        
        self.reviewButton.setImage(UIImage(named:"ic_review"), for: .normal)
        
        self.imageButton.setImage(UIImage(named:"ic_camera"), for: .normal)
        
        self.firstImageView.image = UIImage.init(named: "ic_image")
        self.secondImageView.image = UIImage.init(named: "ic_image")
        self.thirdImageView.image = UIImage.init(named: "ic_image")
        
        self.firstImageView.contentMode = .scaleAspectFit
        self.secondImageView.contentMode = .scaleAspectFit
        self.thirdImageView.contentMode = .scaleAspectFit
        
        
        self.reviewTextView.text = "The commentation"
        self.reviewTextView.numberOfLines = 0
        self.reviewTextView.font = UIFont(name: "Georgia-Bold", size: 12)

        
        /// Configure cell
        self.questionTextView.isUserInteractionEnabled = false
        self.questionTextView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        self.reviewTextView.isUserInteractionEnabled = false
        self.reviewTextView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        //Add Shadow Here
        self.questionTextView.addShadow();
    }
    
    func setupLayout() {
        self.containerView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.scrollView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self._contentView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.bottom.equalTo(self.imageButton.snp.bottom)
        }
        
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(80)
        }
        
        self.firstChoiceLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
        }
        
        self.firstChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.firstChoiceLabel.snp.trailing).offset(5)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
        }
        
        self.secondChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self._contentView.snp.centerX).offset(-2)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.secondChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._contentView.snp.centerX).offset(3)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.thirdChoiceButton.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
        }
        
        self.thirdChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdChoiceButton.snp.leading).offset(-5)
            make.width.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
        }
        
        self.reviewButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.top.equalTo(self.firstChoiceButton.snp.bottom).offset(10)
        }
        
        self.imageButton.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.top.equalTo(self.reviewButton.snp.bottom).offset(0)
            make.height.equalTo(45)
            make.width.equalTo(45)
        }
        
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.secondImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.dashedLineView.snp.remakeConstraints { (make) in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
    
    func setupLayoutForAddingComment() {
        self.reviewTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.imageButton.snp.bottom).offset(5)
            make.height.equalTo(self.heightOfReviewLabel)
        }
    }
}


class ChecklistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var titleLabel: UILabel = UILabel()
    
    var customView: UIView = UIView()
    
    var questions: [Questions] = [Questions]()
    
    let imagePicker = UIImagePickerController()
    
    var changeLanguageButton: UIButton = UIButton()
    
    var listOfQuestionIds: [Int64] = [Int64]()
    
    var defaultLanguage: Int = 0 // 0: vn 1: en
    
    var doneQuestions: [Int] = [Int]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if questions[indexPath.row].review == "" {
            return 230
        } else {
            return 240 + questions[indexPath.row].heightOfComment
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !doneQuestions.contains(indexPath.row) {
            doneQuestions.append(indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewChecklistTableViewCell", for: indexPath)
            as! NewChecklistTableViewCell
        let question = questions[indexPath.row]
        if defaultLanguage == 0 {
            cell.questionTextView.text = question.title_vn
        } else {
            cell.questionTextView.text = question.title_en
        }
        
        cell.heightOfReviewLabel = question.heightOfComment
        
        if questions[indexPath.row].review != "" {
            cell.reviewTextView.text = question.review
            cell.reviewTextView.numberOfLines = 0
            cell.reviewTextView.setContentCompressionResistancePriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            cell.reviewTextView.setContentHuggingPriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            cell.setupLayoutForAddingComment()
            
        }
        
        cell.fisrtChoiceButtonTapped = {
            cell.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            
            if !self.doneQuestions.contains(indexPath.row) {
                self.doneQuestions.append(indexPath.row)
            }
            
            self.questions[indexPath.row].questionChoice = 1
            
        }
        
        cell.secondChoiceButtonTapped = {
            cell.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            
            if !self.doneQuestions.contains(indexPath.row) {
                self.doneQuestions.append(indexPath.row)
            }
            
            self.questions[indexPath.row].questionChoice = 2
        }
        
        cell.thirdChoiceButtonTapped = {
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            
            if !self.doneQuestions.contains(indexPath.row) {
                self.doneQuestions.append(indexPath.row)
            }
            
            self.questions[indexPath.row].questionChoice = 3
        }
        
        cell.reviewButtonTapped = {
            let vc = ReviewViewController()
            vc.idxCheckList = indexPath.row
            vc.comment = question.review
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.imageButtonTapped = {
            let vc = ImageReviewViewController()
            vc.idxCheckList = indexPath.row
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.firstImageView.image = question.imgCaptured[0]
        cell.secondImageView.image = question.imgCaptured[1]
        cell.thirdImageView.image = question.imgCaptured[2]
        
        
        return cell
    }

    private var completedButton: UIButton = UIButton()
    
    private var checklistTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupView()
        setupLayout()
        
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
        
        self.imagePicker.delegate = self
        
        self.completedButton.layer.masksToBounds = true
        self.completedButton.layer.borderColor = UIColor.white.cgColor
        self.completedButton.layer.borderWidth = 2
        self.completedButton.layer.cornerRadius = 10
    
        self.completedButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)

        self.completedButton.setTitle("Complete", for: .normal)
        
        self.checklistTableView.backgroundColor = UIColor.clear
        self.checklistTableView.separatorStyle = .none
        self.checklistTableView.showsVerticalScrollIndicator = false
        self.checklistTableView.register(NewChecklistTableViewCell.self, forCellReuseIdentifier: NewChecklistTableViewCell.CELL_IDENTIFIER)
        
        self.questions = filterQuestions()
    }
    
    func filterQuestions() -> [Questions] {
        var result = [Questions]()
        if let unarchivedObject = UserDefaults.standard.object(forKey: "questions") as? Data {
            let questions = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Questions])!
            for q in questions {
                if self.listOfQuestionIds.contains(q.question_id) {
                    result.append(q)
                }
            }
        }
        return result
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
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.completedButton)
        self.view.addSubview(self.customView)
        self.customView.addSubview(self.backButton)
        self.customView.addSubview(self.changeLanguageButton)
        
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        
        self.changeLanguageButton.setImage(UIImage(named: "icon_changeLanguage"), for: .normal)
        self.changeLanguageButton.addTarget(self, action: #selector(changeLanguageButtonOnClick), for: .touchUpInside)
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        self.completedButton.addTarget(self, action: #selector(completedButtonOnClick), for: .touchUpInside)
        self.completedButton.titleLabel!.font = UIFont(name: "Georgia-Bold" , size: 19)

        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Check List"
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
        
        self.changeLanguageButton.snp.remakeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
            make.width.height.equalTo(35)
        }
        
        self.titleLabel.snp.remakeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalToSuperview()
        }
        
        self.completedButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.40)
            make.height.equalTo(60)
        }
        
        self.checklistTableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.backButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.completedButton.snp.top).offset(-10)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func completedButtonOnClick() {
        let vc = PreviewChecklistsTableViewController()
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.questions = self.questions
        vc.defaultLanguage = self.defaultLanguage
        vc.doneQuestions = self.doneQuestions.count
        self.present(vc, animated: false, completion: nil)
    }
    
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func changeLanguageButtonOnClick() {
        defaultLanguage = (defaultLanguage + 1) % 2
        self.checklistTableView.reloadData()
    }

    
    @objc func userInfoButtonOnClick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

extension ChecklistsTableViewController: ReviewViewProtocol {
    func didTapDoneButton(idxRow: Int, comment: String, heightOfButton: CGFloat) {
        questions[idxRow].review = comment
        questions[idxRow].heightOfComment = heightOfButton
        
        if !doneQuestions.contains(idxRow) {
            doneQuestions.append(idxRow)
        }
        
        self.checklistTableView.reloadData()
        

    }
}

extension ChecklistsTableViewController: ImageReviewViewProtocol {
    func didFinishChoosingImage(idxRow: Int, image: UIImage) {
        let idx = questions[idxRow].numberOfCapturedImg
        questions[idxRow].imgCaptured[idx % 3] = image
        questions[idxRow].numberOfCapturedImg = (questions[idxRow].numberOfCapturedImg + 1) % 3
        questions[idxRow].latestImage = image
        
        if !doneQuestions.contains(idxRow) {
            doneQuestions.append(idxRow)
        }
        
        self.checklistTableView.reloadData()
    }
}

extension UIView{
    func addShadow() {
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowOpacity = 0.7;
        self.layer.shadowRadius = 3.0;
        self.layer.masksToBounds = false
    }
}

