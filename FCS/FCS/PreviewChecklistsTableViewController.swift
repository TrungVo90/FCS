
import Foundation
import SnapKit

class PreviewCheckListTableViewCell: UITableViewCell {
    
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
    
    var reviewTextView: UILabel = UILabel()
    
    var firstImageView: UIImageView = UIImageView()
    var secondImageView: UIImageView = UIImageView()
    var thirdImageView: UIImageView = UIImageView()
    
    var dashedLineView: UIView = UIView()
    
    var heightOfReviewLabel: CGFloat = 0
    var heightOfQuestionLabel: CGFloat = 0
    
    static var CELL_IDENTIFIER: String = "PreviewChecklistTableViewCell"

    
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
        
        self._contentView.addSubview(self.reviewTextView)
        self._contentView.addSubview(self.firstImageView)
        self._contentView.addSubview(self.secondImageView)
        self._contentView.addSubview(self.thirdImageView)
        
        self.containerView.addSubview(self.dashedLineView)
    
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
            make.bottom.equalTo(self.firstImageView.snp.bottom)
        }
        
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(10)
        }
        
        self.firstChoiceLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(40)
        }
        
        self.firstChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.firstChoiceLabel.snp.trailing).offset(5)
            make.top.equalTo(self.firstChoiceLabel)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        self.secondChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self._contentView.snp.centerX).offset(-2)
            make.top.equalTo(self.firstChoiceLabel)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.secondChoiceButton.snp.remakeConstraints { (make) in
            make.leading.equalTo(self._contentView.snp.centerX).offset(3)
            make.top.equalTo(self.firstChoiceLabel)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.thirdChoiceButton.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
            make.top.equalTo(self.firstChoiceLabel)
        }
        
        self.thirdChoiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.thirdChoiceButton.snp.leading).offset(-5)
            make.width.height.equalTo(30)
            make.top.equalTo(self.firstChoiceLabel)
        }
        
        self.secondImageView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.firstChoiceButton.snp.bottom).offset(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.secondImageView.snp.trailing).offset(10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(50)
            make.height.equalTo(50)
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
            make.top.equalTo(self.firstImageView.snp.bottom).offset(5)
            make.height.equalTo(self.heightOfReviewLabel)
        }
    }
    
    func setupLayoutForQuestion() {
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(self.heightOfQuestionLabel)
        }
    }
}

class PreviewChecklistsTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var backButton: UIButton = UIButton()
    
    var userInfoButton: UIButton = UIButton()
    
    var titleLabel: UILabel = UILabel()
    
    var customView: UIView = UIView()
    
    var questions: [Questions] = [Questions]()
    
    var defaultLanguage: Int = 0 // 0: vn 1: en
    
    var doneQuestions: Int = 0
    
    var finishedPercentLabel: UILabel = UILabel()
    
    var highLabel: UILabel = UILabel()
    
    var mediumLabel: UILabel = UILabel()
    
    var lowLabel: UILabel = UILabel()

    var veryLowLabel: UILabel = UILabel()
    
    var greenLabel: UILabel = UILabel()
    
    var yellowLabel: UILabel = UILabel()
    
    var purpleLabel: UILabel = UILabel()
    
    var redLabel: UILabel = UILabel()
    
    var summarizationView: UIView = UIView()
    
    var originalQuestions: [Questions] = [Questions]()

    var listOfQuestionIds: [Int64] = [Int64]()
    
    
    
    var categories: [Categories] = [Categories]()
    
    var companyQuestions: [CompanyQuestions] = [CompanyQuestions]()
    
    var companyId: Int64 = 0
    
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
            if q.category_id == categoryId && q.company_id == companyId {
                self.listOfQuestionIds.append(q.question_id)
            }
        }
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let heightOfQuestion = calculateHeightOfQuestion(question: questions[indexPath.row], width: tableView.frame.width - 10)
        questions[indexPath.row].heightOfQuestion = heightOfQuestion
        if questions[indexPath.row].review == "" {
            return 230
        } else {
            return 240 + questions[indexPath.row].heightOfComment
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filterListOfCompanyQuestionIds(companyId: companyId, categoryId: Int64(self.categories[section].id))
        self.questions = filterQuestions()
        return self.questions.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.categories[section].name
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Do nothing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviewCheckListTableViewCell.CELL_IDENTIFIER, for: indexPath)
            as! PreviewCheckListTableViewCell
        let question = self.questions[indexPath.row]
        if defaultLanguage == 0 {
            cell.questionTextView.text = question.title_vn
        } else {
            cell.questionTextView.text = question.title_en
        }
        
        cell.heightOfReviewLabel = question.heightOfComment
        
        if question.review != "" {
            cell.reviewTextView.text = question.review
            cell.reviewTextView.numberOfLines = 0
            cell.reviewTextView.setContentCompressionResistancePriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            cell.reviewTextView.setContentHuggingPriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            cell.setupLayoutForAddingComment()
        }
        
        if questions[indexPath.row].questionChoice == 1 {
            
            cell.firstChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
           
            cell.secondChoiceButton.isHidden = false
            cell.secondChoiceLabel.isHidden = false
            cell.thirdChoiceButton.isHidden = false
            cell.thirdChoiceLabel.isHidden = false
            
        }
        
        if questions[indexPath.row].questionChoice == 2 {
            cell.secondChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
        
            cell.firstChoiceButton.isHidden = false
            cell.firstChoiceLabel.isHidden = false
            cell.thirdChoiceButton.isHidden = false
            cell.thirdChoiceLabel.isHidden = false
        }
        
        if questions[indexPath.row].questionChoice == 3 {
            cell.thirdChoiceButton.setImage(UIImage(named:"ic_check"), for: .normal)
            cell.firstChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
            cell.secondChoiceButton.setImage(UIImage(named:"ic_circle"), for: .normal)
          
            cell.firstChoiceButton.isHidden = false
            cell.firstChoiceLabel.isHidden = false
            cell.secondChoiceButton.isHidden = false
            cell.secondChoiceLabel.isHidden = false
        }
        
        
        cell.firstChoiceButton.isUserInteractionEnabled = false
        cell.secondChoiceButton.isUserInteractionEnabled = false
        cell.thirdChoiceButton.isUserInteractionEnabled = false
        
        cell.firstImageView.image = questions[indexPath.row].imgCaptured[0]
        cell.secondImageView.image = questions[indexPath.row].imgCaptured[1]
        cell.thirdImageView.image = questions[indexPath.row].imgCaptured[2]
        
        return cell
    }
    
    private var submitButton: UIButton = UIButton()
    
    private var checklistTableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        setupView()
        setupLayout()
        
        self.checklistTableView.delegate = self
        self.checklistTableView.dataSource = self
        
        self.submitButton.layer.masksToBounds = true
        self.submitButton.layer.borderColor = UIColor.white.cgColor
        self.submitButton.layer.borderWidth = 2
        self.submitButton.layer.cornerRadius = 10
        
        submitButton.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        self.submitButton.titleLabel!.font = UIFont(name: "Georgia-Bold" , size: 19)

        submitButton.setTitle("Submit", for: .normal)
        
        self.checklistTableView.backgroundColor = UIColor.clear
        self.checklistTableView.separatorStyle = .none
        self.checklistTableView.showsVerticalScrollIndicator = false
        self.checklistTableView.register(PreviewCheckListTableViewCell.self, forCellReuseIdentifier: PreviewCheckListTableViewCell.CELL_IDENTIFIER)
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
        
        ///
        
        var string: String = "Tổng số điểm thực tế: " + self.doneQuestions.description + "Tổng số điểm yêu cầu: " + self.questions.count.description

        let percent = CGFloat(self.doneQuestions)/CGFloat(self.questions.count)
        string = string + "\n" + percent.description + "%"
        
        self.finishedPercentLabel.text = string
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.submitButton)
        self.view.addSubview(self.customView)
        self.customView.addSubview(self.backButton)
        //        self.customView.addSubview(self.userInfoButton)
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
        //        self.userInfoButton.setImage(UIImage(named: "ic_user"), for: .normal)
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        self.submitButton.addTarget(self, action: #selector(submitButtonOnClick), for: .touchUpInside)
        
        //        self.userInfoButton.addTarget(self, action: #selector(userInfoButtonOnClick), for: .touchUpInside)
        
        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Preview Check List"
        self.titleLabel.textAlignment = .center
        
        self.summarizationView.addSubview(self.finishedPercentLabel)
        self.summarizationView.addSubview(self.highLabel)
        self.summarizationView.addSubview(self.mediumLabel)
        self.summarizationView.addSubview(self.lowLabel)
        self.summarizationView.addSubview(self.veryLowLabel)
        self.summarizationView.addSubview(self.greenLabel)
        self.summarizationView.addSubview(self.yellowLabel)
        self.summarizationView.addSubview(self.purpleLabel)
        self.summarizationView.addSubview(self.redLabel)
        
        self.greenLabel.backgroundColor = UIColor.green
        self.yellowLabel.backgroundColor = UIColor.yellow
        self.purpleLabel.backgroundColor = UIColor.purple
        self.redLabel.backgroundColor = UIColor.red
        
        self.highLabel.text = "91-100%"
        self.mediumLabel.text = "81-90%"
        self.lowLabel.text = "75-80%"
        self.veryLowLabel.text = "0-74%"
        
        self.view.addSubview(self.summarizationView)
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
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview()
        }
        
        self.submitButton.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.40)
            make.height.equalTo(60)
        }
        
        setupLayoutSummarizationView()
        
        self.checklistTableView.snp.remakeConstraints { (make) in
            make.top.equalTo(self.backButton.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.summarizationView.snp.top).offset(-5)
        }
        
    }
    
    func setupLayoutSummarizationView() {
        self.summarizationView.snp.remakeConstraints { (make) in
            make.height.equalTo(90)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.submitButton.snp.top).offset(-5)
        }
        
        self.finishedPercentLabel.snp.remakeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.4)
            make.leading.trailing.equalToSuperview()
        }
        
        self.highLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.finishedPercentLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.greenLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.finishedPercentLabel.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.mediumLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.highLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.yellowLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.greenLabel.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.lowLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.mediumLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.purpleLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.yellowLabel.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.veryLowLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.lowLabel.snp.bottom)
            make.leading.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        self.redLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.purpleLabel.snp.bottom)
            make.trailing.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func submitButtonOnClick() {
        /// To do: Implement later
    }
    
    @objc func backButtonOnClick() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func userInfoButtonOnClick() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
}
