

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
    
    var questionIdxLabel: UILabel = UILabel()
    
    var reviewTextView: UILabel = UILabel()
    
    var imageButton: UIButton = UIButton()
    var firstImageView: UIImageView =  UIImageView(image: UIImage(named:"ic_image"))
    var secondImageView: UIImageView = UIImageView(image: UIImage(named:"ic_image"))
    var thirdImageView: UIImageView = UIImageView(image:UIImage(named:"ic_image"))
    
    var dashedLineView: UIView = UIView()
    
    var heightOfReviewLabel: CGFloat = 0
    var heightOfQuestionLabel: CGFloat = 0
    
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
        self._contentView.addSubview(self.questionIdxLabel)
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
        
        self.questionIdxLabel.textAlignment = .center
        self.questionIdxLabel.font = UIFont(name: "Georgia-Bold", size: 12)
        
        
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
        
        self.questionIdxLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(20)
            make.centerY.equalTo(self.questionTextView)
            make.height.equalTo(20)
        }
        
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(10)
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
            make.leading.equalToSuperview().offset(50)
            make.width.equalTo(45)
            make.height.equalTo(45)
            make.top.equalTo(self.firstChoiceButton.snp.bottom).offset(10)
        }
        
        self.imageButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(reviewButton.snp.trailing).offset(10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.height.equalTo(45)
            make.width.equalTo(45)
        }
        
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-50)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        self.secondImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.reviewButton.snp.top)
            make.width.equalTo(40)
            make.height.equalTo(40)
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
    
    func setupLayoutForQuestion() {
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(self.heightOfQuestionLabel)
        }
        //Add Shadow Here
        self.questionTextView.addShadow()
        
        let size = 20.0
        self.questionIdxLabel.bounds = CGRect.init(x: 0, y: 0, width: size, height: size)
        self.questionIdxLabel.layer.cornerRadius = CGFloat(size / 2)
        self.questionIdxLabel.layer.borderWidth = 1.0
        self.questionIdxLabel.layer.backgroundColor = UIColor.clear.cgColor
        self.questionIdxLabel.layer.borderColor = UIColor.black.cgColor
    }
    
}


class ChecklistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var titleLabel: UILabel = UILabel()
    
    var customView: UIView = UIView()
    
    var questions: [Questions] = [Questions]()
    
    var originalQuestions: [Questions] = [Questions]()
    
    let imagePicker = UIImagePickerController()
    
    var changeLanguageButton: UIButton = UIButton()
    
    var dropDownMenu: DKDropMenu = DKDropMenu()
    
    var listOfQuestionIds: [Int64] = [Int64]()
    
    var defaultLanguage: Int = 0 // 0: vn 1: en
    
    var doneQuestions: [Questions] = [Questions]()
    
    var categories: [Categories] = [Categories]()
    
    var companyQuestions: [CompanyQuestions] = [CompanyQuestions]()
    
    var companyId: Int64 = 0
    
    var branchId: Int64 = 0
    
    var commonCommentLabel: UILabel = UILabel()
    
    var commonCommentTextView: UITextView = UITextView()
    
    var commonReview: String = ""
    
    var totalQuestions: [Questions] = [Questions]()
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row >= questions.count {
            return 0
        }
        var heightOfQuestion: CGFloat = 0;
        
        if (indexPath.row < questions.count) {
            heightOfQuestion = calculateHeightOfQuestion(question: questions[(indexPath.row)], width: tableView.frame.width - 10)
        }
        questions[indexPath.row].heightOfQuestion = heightOfQuestion
        if questions[indexPath.row].review == "" {
            return 120 + heightOfQuestion //230
        } else {
            return 120 + questions[indexPath.row].heightOfComment + heightOfQuestion//240
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterListOfCompanyQuestionIds(companyId: companyId, categoryId: Int64(self.categories[section].id))
        self.questions = filterQuestions()
        for q in self.questions {
            if !totalQuestions.contains(q) {
                totalQuestions.append(q)
                doneQuestions.append(q)
            }
        }
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.categories[section].name
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !doneQuestions.contains(questions[indexPath.row]) {
            doneQuestions.append(questions[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewChecklistTableViewCell", for: indexPath)
            as! NewChecklistTableViewCell

        filterListOfCompanyQuestionIds(companyId: companyId, categoryId: Int64(self.categories[indexPath.section].id))
        self.questions = filterQuestions()
        
        let heightOfQuestion = calculateHeightOfQuestion(question: questions[indexPath.row], width: tableView.frame.width - 10)
        questions[indexPath.row].heightOfQuestion = heightOfQuestion
        
        let question = questions[indexPath.row]
        if defaultLanguage == 0 {
            cell.questionTextView.text = question.title_vn
        } else {
            cell.questionTextView.text = question.title_en
        }
        
        cell.questionIdxLabel.text =  String(indexPath.row + 1)
        
        cell.heightOfReviewLabel = question.heightOfComment
        cell.heightOfQuestionLabel = question.heightOfQuestion
        cell.setupLayoutForQuestion()
        if question.review != "" {
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
            
            self.filterListOfCompanyQuestionIds(companyId: self.companyId, categoryId: Int64(self.categories[indexPath.section].id))
            self.questions = self.filterQuestions()
            
            question.questionChoice = 1
            self.replaceQuestionById(question: question)
            
        }
        
        cell.secondChoiceButtonTapped = {
            cell.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            
            self.filterListOfCompanyQuestionIds(companyId: self.companyId, categoryId: Int64(self.categories[indexPath.section].id))
            self.questions = self.filterQuestions()
            
            question.questionChoice = 2
            self.replaceQuestionById(question: question)
        }
        
        cell.thirdChoiceButtonTapped = {
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            
            self.filterListOfCompanyQuestionIds(companyId: self.companyId, categoryId: Int64(self.categories[indexPath.section].id))
            self.questions = self.filterQuestions()
            
            question.questionChoice = 3
            self.replaceQuestionById(question: question)
        }
        
        cell.reviewButtonTapped = {
            let vc = ReviewViewController()
            vc.question = question
            vc.idxCheckList = indexPath.row
            vc.comment = question.review
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        
        cell.imageButtonTapped = {
            let vc = ImageReviewViewController()
            vc.idxQuestion = question.question_id
            vc.idxCheckList = indexPath.row
            vc.idxCategory = indexPath.section
            vc.modalPresentationCapturesStatusBarAppearance = true
            vc.question = question
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        start_time = Date()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let unarchivedObject = UserDefaults.standard.object(forKey: "question_categories") as? Data {
            self.categories = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Categories])!
        }
        
        /// Load list of company question
        if let unarchivedObject = UserDefaults.standard.object(forKey: "company_questions") as? Data {
            self.companyQuestions = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [CompanyQuestions])!
        }
        
        // Do any additional setup after loading the view, typically from a nib.
        if let unarchivedObject = UserDefaults.standard.object(forKey: "questions") as? Data {
            let questions = (NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [Questions])!
            self.originalQuestions = questions
        }
        
        setupView()
        
        self.imagePicker.delegate = self
        
        self.completedButton.layer.masksToBounds = true
        self.completedButton.layer.borderColor = UIColor.white.cgColor
        self.completedButton.layer.borderWidth = 2
        self.completedButton.layer.cornerRadius = 10
    
        self.completedButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)

        self.completedButton.setTitle("Complete", for: .normal)
        
        self.checklistTableView.separatorStyle = .none
        self.checklistTableView.showsVerticalScrollIndicator = false
        self.checklistTableView.register(NewChecklistTableViewCell.self, forCellReuseIdentifier: NewChecklistTableViewCell.CELL_IDENTIFIER)

        
        setupLayout()
    }
    
    private func calculateHeightOfQuestion(question: Questions, width: CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = defaultLanguage == 0 ? question.title_vn : question.title_en
        label.font = UIFont(name:"Georgia", size: 15.0)
        
        label.sizeToFit()

        return label.frame.height + 10
    }
    
    private func filterListOfCompanyQuestionIds(companyId: Int64, categoryId: Int64) {
        self.listOfQuestionIds = [Int64]()
        for q in self.companyQuestions {
            print(String(q.question_id) + " - " + String("category: ") + (String(q.category_id)) + " - companyId" + String(q.company_id))
            if q.category_id == categoryId && q.company_id == companyId {
                self.listOfQuestionIds.append(q.question_id)
            }
            
        }
        print("======")
    }
    
    func filterQuestions() -> [Questions] {
        var result = [Questions]()
        
            for q in self.originalQuestions {
                if self.listOfQuestionIds.contains(q.question_id) {
                    result.append(q)
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
        self.view.addSubview(self.dropDownMenu)
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.completedButton)
        self.view.addSubview(self.customView)
        self.view.addSubview(self.commonCommentTextView)
        self.view.addSubview(self.commonCommentLabel)
        self.customView.addSubview(self.backButton)
        //self.customView.addSubview(self.changeLanguageButton)

        self.checklistTableView.backgroundColor = UIColor.clear
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        
        self.changeLanguageButton.setImage(UIImage(named: "icon_changeLanguage"), for: .normal)
        self.changeLanguageButton.addTarget(self, action: #selector(changeLanguageButtonOnClick), for: .touchUpInside)
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
        
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
        
        dropDownMenu.backgroundColor = UIColor.white
        dropDownMenu.add(names: ["Vietnamese", "English"])
        dropDownMenu.delegate = self
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        self.completedButton.addTarget(self, action: #selector(completedButtonOnClick), for: .touchUpInside)
        self.completedButton.titleLabel!.font = UIFont(name: "Georgia-Bold" , size: 19)

        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Check List"
        self.titleLabel.textAlignment = .center
        
        self.commonCommentLabel.font = UIFont(name: "Georgia-Bold", size: 12)
        self.commonCommentLabel.text = "Comment"
        self.commonCommentTextView.font = UIFont(name: "Georgia-Bold", size: 12)
        
        self.commonCommentTextView.backgroundColor = .lightGray
        self.commonCommentLabel.backgroundColor = .clear
        
        self.commonCommentTextView.delegate = self
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
        
        self.dropDownMenu.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(self.customView.snp.bottom)
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
            make.top.equalTo(self.dropDownMenu.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.commonCommentTextView.snp.top).offset(-20)
        }
        
        self.commonCommentLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalTo(self.commonCommentTextView)
            make.height.equalTo(15)
            make.width.equalTo(100)
        }
        
        self.commonCommentTextView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(self.completedButton.snp.top).offset(-5)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
            make.leading.equalTo(self.commonCommentLabel.snp.trailing).offset(5)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func completedButtonOnClick() {
        let vc = PreviewChecklistsTableViewController()
        vc.modalPresentationCapturesStatusBarAppearance = true
        vc.originalQuestions = self.originalQuestions
        vc.defaultLanguage = self.defaultLanguage
        vc.doneQuestions = self.doneQuestions
        vc.companyId = self.companyId
        vc.companyQuestions = self.companyQuestions
        vc.categories = self.categories
        vc.commonReview = self.commonReview
        vc.defaultLang = "vn"
        vc.questions = self.questions
        vc.branchId = self.branchId
        vc.totalQuestions = self.totalQuestions
        if self.defaultLanguage == 1 {
            vc.defaultLang = "en"
        }
        
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

extension ChecklistsTableViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        // Your code here
        self.commonReview = textView.text
    }
}

extension ChecklistsTableViewController: ReviewViewProtocol {
    func didTapDoneButton(question: Questions) {
        
        replaceQuestionById(question: question)
        
        self.checklistTableView.reloadData()
        
    }
    
    func replaceQuestionById(question: Questions) {
        var idx = 0
        for q in self.originalQuestions {
            if q.question_id == question.question_id {
                self.originalQuestions[idx] = question
                break
            }
            idx += 1
        }
        
        idx = 0
        for q in self.doneQuestions {
            if q.question_id == question.question_id {
                self.doneQuestions[idx] = question
                break
            }
            idx += 1
        }
    }
    
}

extension ChecklistsTableViewController: ImageReviewViewProtocol {
    
    func didFinishChoosingImage(question: Questions) {
        replaceQuestionById(question: question)
        
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

extension ChecklistsTableViewController: DKDropMenuDelegate  {
    
    func itemSelected(withIndex: Int, name: String) {
        self.defaultLanguage = withIndex;
        print("selected item:\(withIndex)")
    }
    
    func collapsedChanged() {
        self.checklistTableView.reloadData()
        print("collapsedChanged")

    }
}

