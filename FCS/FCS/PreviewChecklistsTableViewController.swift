
import Foundation
import SnapKit

class PreviewCheckListTableViewCell: UITableViewCell {
    
    var scrollView = UIScrollView()
    var containerView = UIView()
    
    var _contentView = UIView()
    
    var questionTextView: UITextView = UITextView()
    
    var choiceLabel: UILabel = UILabel()
    
    var reviewTextView: UILabel = UILabel()
    
    var firstImageView: UIImageView = UIImageView()
    var secondImageView: UIImageView = UIImageView()
    var thirdImageView: UIImageView = UIImageView()
    
    var dashedLineView: UIView = UIView()
    var questionIdxLabel: UILabel = UILabel()
    
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
        
        self.scrollView.isScrollEnabled = false
        self.scrollView.addSubview(self._contentView)
        self._contentView.addSubview(self.questionTextView)
        self._contentView.addSubview(self.questionIdxLabel)
        self._contentView.addSubview(self.choiceLabel)
        
        self._contentView.addSubview(self.reviewTextView)
        self._contentView.addSubview(self.firstImageView)
        self._contentView.addSubview(self.secondImageView)
        self._contentView.addSubview(self.thirdImageView)
        
        self.containerView.addSubview(self.dashedLineView)
    
        //// Set color
        
        self.dashedLineView.backgroundColor = .lightGray
        
        self.questionTextView.text = "Question 1?"
        
        self.choiceLabel.font = UIFont(name: "Georgia-Bold", size: 12)
        
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
        
        let size = 20.0
        self.choiceLabel.bounds = CGRect.init(x: 0, y: 0, width: size, height: size)
        self.choiceLabel.layer.cornerRadius = 2.0//CGFloat(size / 2)
        self.choiceLabel.layer.borderWidth = 1.0
        self.choiceLabel.layer.backgroundColor = UIColor.clear.cgColor
        self.choiceLabel.layer.borderColor = UIColor.black.cgColor
        
        self.choiceLabel.textAlignment = .center
        
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
            make.bottom.equalTo(self.firstImageView.snp.bottom)
        }
        
        self.questionIdxLabel.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(20)
            make.centerY.equalTo(self.questionTextView)
            make.height.equalTo(20)
        }
        
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(20)
        }
        
        self.choiceLabel.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.questionTextView).offset(3)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        self.secondImageView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.questionTextView.snp.bottom).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
    
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.secondImageView.snp.trailing).offset(10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.secondImageView)
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
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.firstImageView.snp.bottom).offset(5)
            make.height.equalTo(self.heightOfReviewLabel)
        }
    }
    
    func setupLayoutForAddingCommentNoneImage() {
        self.reviewTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(self.questionTextView.snp.bottom).offset(25)
            make.height.equalTo(self.heightOfReviewLabel)
        }
    }
    
    func setupLayoutForQuestion() {
        self.questionTextView.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().offset(-40)
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(self.heightOfQuestionLabel)
        }
    }
    
    func hideImageViews() {
        self.secondImageView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.questionTextView.snp.bottom).offset(40)
            make.width.equalTo(0)
            make.height.equalTo(0)
        }
        
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.secondImageView.snp.trailing).offset(10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(0)
            make.height.equalTo(0)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(0)
            make.height.equalTo(0)
        }
    }
    
    func hideImageViewsWithIdx(idx: Int) {
        if idx == 0 {
            self.firstImageView.snp.remakeConstraints { (make) in
                make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
                make.top.equalTo(self.secondImageView)
                make.width.equalTo(0)
                make.height.equalTo(0)
            }
        } else if idx == 1 {
            self.secondImageView.snp.remakeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.questionTextView.snp.bottom).offset(40)
                make.width.equalTo(0)
                make.height.equalTo(0)
            }
        } else if idx == 2 {
            self.thirdImageView.snp.remakeConstraints { (make) in
                make.leading.equalTo(self.secondImageView.snp.trailing).offset(10)
                make.top.equalTo(self.secondImageView)
                make.width.equalTo(0)
                make.height.equalTo(0)
            }
        }
    }
    
    func showImageViews() {
        self.secondImageView.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.questionTextView.snp.bottom).offset(40)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.thirdImageView.snp.remakeConstraints { (make) in
            make.leading.equalTo(self.secondImageView.snp.trailing).offset(10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        self.firstImageView.snp.remakeConstraints { (make) in
            make.trailing.equalTo(self.secondImageView.snp.leading).offset(-10)
            make.top.equalTo(self.secondImageView)
            make.width.equalTo(80)
            make.height.equalTo(80)
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
    
    var doneQuestions: [Questions] = [Questions]()
    
    var finishedPercentLabel: UILabel = UILabel()

    var actualPercentLabel: UILabel = UILabel()

    var percentLabel: UILabel = UILabel()
    
    var finishedPercentValue: UILabel = UILabel()
    
    var actualPercentValue: UILabel = UILabel()
    
    var percentValue: UILabel = UILabel()
    
    var colorLabel: UILabel = UILabel()
    
    var summarizationView: UIView = UIView()

    var leftVerticalLine: UIView = UIView()

    var middleVerticalLine: UIView = UIView()

    var rightVerticalLine: UIView = UIView()

    var topHorizontalLine: UIView = UIView()

    var topMiddleHorizontalLine: UIView = UIView()

    var bottomMiddleHorizontalLine: UIView = UIView()

    var bottomHorizontalLine: UIView = UIView()

    var originalQuestions: [Questions] = [Questions]()

    var listOfQuestionIds: [Int64] = [Int64]()
    
    var categories: [Categories] = [Categories]()
    
    var companyQuestions: [CompanyQuestions] = [CompanyQuestions]()
    
    var companyId: Int64 = 0
    
    var commonReview: String = ""
    
    var defaultLang: String = "en"
    
    var branchId: Int64 = 0
    
    var totalQuestions = [Questions]()
    
    private func calculateHeightOfQuestion(question: Questions, width: CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = defaultLanguage == 0 ? question.title_vn : question.title_en
        label.font = UIFont(name:"Georgia", size: 15.0)
        
        label.sizeToFit()
        if question.questionChoice > 0 {
            return label.frame.height + 10
        }
        return 0
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
    
    var currentIdx : Int64 = 0
    
    func setIdxForQuestion(question: Questions) -> Questions{
        
        var idx = 0
        for q in self.originalQuestions {
            if q.question_id == question.question_id {
                break
            }
            idx += 1
        }
        
        for q in self.questions {
            if q.question_id == self.originalQuestions[idx].question_id && self.originalQuestions[idx].currentIdxPreview == 0 && self.originalQuestions[idx].questionChoice > 0{
                self.originalQuestions[idx].currentIdxPreview = currentIdx + 1
                currentIdx = currentIdx + 1
            }
        }
        
        return self.originalQuestions[idx]
    }
    
    func getIndexOfCategory(idCategory: Int64) -> Int {
        var idx = 0
        for c in self.categories {
            if c.id == idCategory {
                return idx
            }
            idx += 1
        }
        return -1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let idxCategory = getIndexOfCategory(idCategory: self.categories[indexPath.section].id)
        if self.categories[idxCategory].isQuestionChoosen == false {
            return 0
        }
        
        if indexPath.row >= questions.count {
            return 0
        }
        var heightOfQuestion: CGFloat = 0;
        
        if (indexPath.row < questions.count) {
            heightOfQuestion = calculateHeightOfQuestion(question: questions[(indexPath.row)], width: tableView.frame.width - 55) + 5
        }
        questions[indexPath.row].heightOfQuestion = heightOfQuestion
        
        if questions[indexPath.row].questionChoice > 0 {
            if questions[indexPath.row].review == "" {
                if questions[indexPath.row].numberOfCapturedImg == 0 {
                    return heightOfQuestion + 10
                }
                return heightOfQuestion + 100
            } else {
                if questions[indexPath.row].numberOfCapturedImg == 0 {
                    return heightOfQuestion + questions[indexPath.row].heightOfComment + 10
                }
                return heightOfQuestion + questions[indexPath.row].heightOfComment + 120
            }
        }
        return 0
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
        let idxCategory = getIndexOfCategory(idCategory: self.categories[section].id)
        if self.categories[idxCategory].isQuestionChoosen == false {
            return ""
        }
        return self.categories[section].name
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Do nothing
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PreviewCheckListTableViewCell.CELL_IDENTIFIER, for: indexPath)
            as! PreviewCheckListTableViewCell
        filterListOfCompanyQuestionIds(companyId: companyId, categoryId: Int64(self.categories[indexPath.section].id))
        self.questions = filterQuestions()
        
        var question = questions[indexPath.row]
        
        question = setIdxForQuestion(question: question)
        
        if defaultLanguage == 0 {
            cell.questionTextView.text = question.title_vn
        } else {
            cell.questionTextView.text = question.title_en
        }
        
        cell.questionIdxLabel.text = String(questions[indexPath.row].currentIdxPreview)
        
        cell.heightOfReviewLabel = question.heightOfComment
        cell.heightOfQuestionLabel = question.heightOfQuestion
        cell.setupLayoutForQuestion()
        cell.choiceLabel.text = String(question.questionChoice)
        if question.review != "" {
            cell.reviewTextView.text = question.review
            cell.reviewTextView.numberOfLines = 0
            cell.reviewTextView.setContentCompressionResistancePriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            cell.reviewTextView.setContentHuggingPriority(UILayoutPriority.init(1000), for: UILayoutConstraintAxis.horizontal)
            if (question.numberOfCapturedImg > 0) {
                cell.setupLayoutForAddingComment()
            } else {
                cell.setupLayoutForAddingCommentNoneImage()
            }
        }
        
        cell.choiceLabel.text = String(question.questionChoice)
        
        cell.firstImageView.isHidden = true
        cell.secondImageView.isHidden = true
        cell.thirdImageView.isHidden = true
        
        if (question.numberOfCapturedImg > 0) {
            
            if (question.numberOfCapturedImg % 3 == 1) {
                cell.firstImageView.image =  question.imgCaptured[0]
                cell.firstImageView.isHidden = false
            }
            else if (question.numberOfCapturedImg % 3 == 2) {
                cell.secondImageView.isHidden = false
                cell.firstImageView.isHidden = false
                cell.firstImageView.image =  question.imgCaptured[0]
                cell.secondImageView.image =  question.imgCaptured[1]
                
            } else if (question.numberOfCapturedImg % 3 == 0) {
                cell.firstImageView.image =  question.imgCaptured[0]
                cell.secondImageView.image =  question.imgCaptured[1]
                cell.thirdImageView.image =  question.imgCaptured[2]
                cell.secondImageView.isHidden = false
                cell.thirdImageView.isHidden = false
                cell.firstImageView.isHidden = false
            }
        }
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
    
    
    let pushingDataIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    fileprivate var _isStatusBarHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return self._isStatusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pushingDataIndicator.center = view.center
        
        // If needed, prevent Indicator from hiding when stopAnimating() is called
        pushingDataIndicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._isStatusBarHidden = false
        self.setNeedsStatusBarAppearanceUpdate()

        self.finishedPercentLabel.text =  "Tổng số điểm thực tế"
        self.actualPercentLabel.text = "Tổng số điểm yêu cầu"
        self.percentLabel.text =  " %"
       
        var finishScore: Int = 0;
        
        
        var actualDoneQuestions = 0
        for q in self.doneQuestions {
           finishScore +=  q.questionChoice
            if q.questionChoice != 0 {
                actualDoneQuestions += 1
            }
        }
        self.finishedPercentValue.text = finishScore.description

        self.actualPercentValue.text = (actualDoneQuestions * 3).description
        var percent :CGFloat = 0.0
        if actualDoneQuestions != 0 {
            percent = CGFloat(finishScore)/CGFloat((actualDoneQuestions * 3))
        }
        
        self.percentValue.text = (Int(100 * percent)).description + "%"
        
        setUpColorPercent(Int(100.0 * (percent)))
    }
    
    func setUpColorPercent(_ percent: Int) {
        if (percent <= 75){
            colorLabel.backgroundColor =   UIColor.red
        } else if (percent <= 80) {
            colorLabel.backgroundColor = UIColor.purple
        } else if (percent <= 90) {
            colorLabel.backgroundColor = UIColor.yellow
        } else if (percent <= 100) {
            colorLabel.backgroundColor = UIColor.green
        }
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.checklistTableView)
        self.view.addSubview(self.submitButton)
        self.view.addSubview(self.customView)
        self.customView.addSubview(self.backButton)
        self.customView.backgroundColor = UIColor.init(red: 78/255, green: 181/255, blue: 251/255, alpha: 1.0)
        
        self.backButton.setImage(UIImage(named: "ic_back_white"), for: .normal)
        
        self.backButton.addTarget(self, action: #selector(backButtonOnClick), for: .touchUpInside)
        self.submitButton.addTarget(self, action: #selector(submitButtonOnClick), for: .touchUpInside)
        
        self.customView.addSubview(self.titleLabel)
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        self.titleLabel.textColor = .white
        self.titleLabel.text = "Preview Check List"
        self.titleLabel.textAlignment = .center
        
        self.finishedPercentLabel.font = UIFont(name: "Georgia-Bold", size: 15)
        self.actualPercentLabel.font = UIFont(name: "Georgia-Bold", size: 15)
        self.percentLabel.font = UIFont(name: "Georgia-Bold", size: 18)
        self.colorLabel.backgroundColor = UIColor.green
        
        
        self.finishedPercentValue.font = UIFont(name: "Georgia-Bold", size: 15)
        self.actualPercentValue.font = UIFont(name: "Georgia-Bold", size: 15)
        self.percentValue.font = UIFont(name: "Georgia-Bold", size: 18)

        self.leftVerticalLine.backgroundColor = UIColor.black

        self.middleVerticalLine.backgroundColor = UIColor.black

        self.rightVerticalLine.backgroundColor = UIColor.black

        self.topHorizontalLine.backgroundColor = UIColor.black

        self.topMiddleHorizontalLine.backgroundColor = UIColor.black

        self.bottomMiddleHorizontalLine.backgroundColor = UIColor.black

        self.bottomHorizontalLine.backgroundColor = UIColor.black

        
        self.summarizationView.addSubview(self.finishedPercentLabel)
        self.summarizationView.addSubview(self.actualPercentLabel)
        self.summarizationView.addSubview(self.percentLabel)
        self.summarizationView.addSubview(self.colorLabel)
        
        
        self.summarizationView.addSubview(self.finishedPercentValue)
        self.summarizationView.addSubview(self.actualPercentValue)
        self.summarizationView.addSubview(self.percentValue)
        
        self.summarizationView.addSubview(self.leftVerticalLine)
        self.summarizationView.addSubview(self.middleVerticalLine)
        self.summarizationView.addSubview(self.rightVerticalLine)

        self.summarizationView.addSubview(self.topHorizontalLine)
        self.summarizationView.addSubview(self.topMiddleHorizontalLine)
        self.summarizationView.addSubview(self.bottomMiddleHorizontalLine)
        self.summarizationView.addSubview(self.bottomHorizontalLine)
        
        self.view.addSubview(self.summarizationView)
        
        self.view.addSubview(pushingDataIndicator)
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
            make.height.equalTo(135)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.submitButton.snp.top).offset(-5)
        }
        
        self.leftVerticalLine.snp.remakeConstraints { (make) in
            make.leading.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(1)
            make.height.equalToSuperview().offset(-5)
        }
        
        self.middleVerticalLine.snp.remakeConstraints { (make) in
            make.centerX.equalToSuperview().offset(70)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(1)
            make.height.equalToSuperview().offset(-5)
        }
        
        self.rightVerticalLine.snp.remakeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-5)
            make.top.equalToSuperview().offset(5)
            make.width.equalTo(1)
            make.height.equalToSuperview().offset(-5)
        }
        
        self.topHorizontalLine.snp.remakeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(1)
        }
        
        self.topMiddleHorizontalLine.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topHorizontalLine.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(1)
        }
        
        self.bottomMiddleHorizontalLine.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topMiddleHorizontalLine.snp.bottom).offset(45)
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(1)
        }
        
        self.bottomHorizontalLine.snp.remakeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-5)
            make.height.equalTo(1)
        }
        
        self.colorLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.bottomMiddleHorizontalLine.snp.bottom)
            make.bottom.equalTo(self.bottomHorizontalLine.snp.bottom).offset(-1)
            make.leading.equalTo(self.middleVerticalLine.snp.trailing)
            make.trailing.equalTo(self.rightVerticalLine.snp.leading)
        }
        
        self.finishedPercentLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topHorizontalLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(55)
            make.trailing.equalTo(self.middleVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.topMiddleHorizontalLine.snp.top).offset(-10)
        }
        
        self.actualPercentLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topMiddleHorizontalLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(55)
            make.trailing.equalTo(self.middleVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.bottomMiddleHorizontalLine.snp.top).offset(-10)
        }
        
        self.percentLabel.snp.remakeConstraints { (make) in
            make.top.equalTo(self.bottomMiddleHorizontalLine.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(125)
            make.trailing.equalTo(self.middleVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.bottomHorizontalLine.snp.top).offset(-10)
        }
        
        self.finishedPercentValue.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topHorizontalLine.snp.bottom).offset(10)
            make.leading.equalTo(self.middleVerticalLine.snp.trailing).offset(50)
            make.trailing.equalTo(self.rightVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.topMiddleHorizontalLine.snp.top).offset(-10)
        }
        
        self.actualPercentValue.snp.remakeConstraints { (make) in
            make.top.equalTo(self.topMiddleHorizontalLine.snp.bottom).offset(10)
            make.leading.equalTo(self.middleVerticalLine.snp.trailing).offset(50)
            make.trailing.equalTo(self.rightVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.bottomMiddleHorizontalLine.snp.top).offset(-10)
        }
        
        self.percentValue.snp.remakeConstraints { (make) in
            make.top.equalTo(self.bottomMiddleHorizontalLine.snp.bottom).offset(10)
            make.leading.equalTo(self.middleVerticalLine.snp.trailing).offset(40)
            make.trailing.equalTo(self.rightVerticalLine.snp.leading).offset(-10)
            make.bottom.equalTo(self.bottomHorizontalLine.snp.top).offset(-10)
        }
    
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func submitButtonOnClick() {
        
        end_time = Date()
        
        let doneChecklist = DoneChecklist()
        doneChecklist.start_time = start_time
        doneChecklist.comment = commonReview
        doneChecklist.end_time = end_time
        doneChecklist.branch_id = branchId
        doneChecklist.company_id = companyId
        doneChecklist.doneQuestions = self.doneQuestions
        doneChecklist.lang = defaultLang
        
        doneChecklist.checklist_id = 0
        
        pushingDataIndicator.stopAnimating()
        // Start Activity Indicator
        pushingDataIndicator.startAnimating()
        
        if Reachability.isConnectedToNetwork() == true {
            
            DataManager.sharedInstance.pushData(doneChecklist: doneChecklist,  completionHandler: {
                (result: String) in
                if result == "OK" {
                    DispatchQueue.main.async {
                    /// Turn off loading indicator
                        self.pushingDataIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    /// Show pop up or alert view to warn
                    let alert = UIAlertController(title: "Error", message: "Failed to complete survey.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                        case .default:
                            DispatchQueue.main.async {
                                /// Turn off loading indicator
                                self.pushingDataIndicator.stopAnimating()
                                self.dismiss(animated: true, completion: nil)
                            }
                            break
                        case .cancel:
                            /// Implement later
                            break
                        case .destructive:
                            /// Implement later
                            break
                        }}))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        } else {
            
            /// Show alert view to inform user that network error
            let alert = UIAlertController(title: "Error", message: "Network error", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    let kUserDefault = UserDefaults.standard
                    /// Store data
                    let encodedData = NSKeyedArchiver.archivedData(withRootObject: doneChecklist) as NSData
                    kUserDefault.set(encodedData, forKey: "doneChecklist")
                    kUserDefault.synchronize()
                    DispatchQueue.main.async {
                        /// Turn off loading indicator
                        self.pushingDataIndicator.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                        
                    }
                    break
                case .cancel:
                    /// Implement later
                    break
                case .destructive:
                    /// Implement later
                    break
                }}))
            self.present(alert, animated: true, completion: nil)
            
        }
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
