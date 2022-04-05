//
//  ViewController.swift
//  QuestionAndAnswers
//
//  Created by 澈水 on 2022/4/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var questionLabel: UILabel = makeQuestionLabel()
    lazy var correctButton: UIButton = makeCorrectButton()
    lazy var errorButton: UIButton = makeErrorButton()
    lazy var selectButtonStackView: UIStackView = makeSelectButtonStackView()
    lazy var questionIndexLabel: UILabel = makeQuestionIndexLabel()
    lazy var scoreLabel: UILabel = makeScoreLabel()
    lazy var bottomStackView: UIStackView = makeBottomStackView()
    lazy var progrcessBar: UIView = makeProgressBar()
    var a: Optional<String> = Optional("!@")
    
    var index: Int = 0 {
        didSet {
            questionIndexLabel.text = "\(index + 1)/\(questions.count)"
            progrcessBar.snp.updateConstraints { make in
                make.width.equalTo(view.frame.width / CGFloat(questions.count) * CGFloat(index + 1))
            }
        }
    }
    
    var score: Int = 0 {
        didSet {
            scoreLabel.text = "得分：\(score)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "backgroundColor")
        correctButton.addTarget(self, action: #selector(onClicked(_:)), for: .touchUpInside)
        errorButton.addTarget(self, action: #selector(onClicked(_:)), for: .touchUpInside)

        setupUI()
    }

    func setupUI(){
    
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        view.addSubview(selectButtonStackView)
        selectButtonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(questionLabel.snp.bottom).offset(200)
        }
        
        view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(selectButtonStackView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(progrcessBar)
        progrcessBar.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(bottomStackView.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.width.equalTo(view.frame.width / CGFloat(questions.count) * CGFloat(index + 1))
        }
        
        questionIndexLabel.snp.makeConstraints { make in
            make.width.equalTo(50)
        }
        
        scoreLabel.snp.makeConstraints { make in
            make.right.equalToSuperview()
        }
    }
    
    func makeQuestionLabel() -> UILabel {
        let questionLabel = UILabel()
        questionLabel.font = UIFont.systemFont(ofSize: 20)
        questionLabel.text = questions[index].text
        questionLabel.textColor = UIColor(named: "textColor")
        questionLabel.textAlignment = .center
        return questionLabel
    }
    
    func makeCorrectButton() -> UIButton {
        let correctButton = UIButton()
        correctButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        correctButton.setTitle("是", for: .normal)
        correctButton.setTitleColor(.black, for: .normal)
        correctButton.setTitleColor(.white, for: .highlighted)
        correctButton.backgroundColor = .green
        correctButton.layer.cornerRadius = 5
        correctButton.tag = 1
        return correctButton
    }
    
    func makeErrorButton() -> UIButton {
        let errorButton = UIButton()
        errorButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(150)
        }
        errorButton.setTitle("否", for: .normal)
        errorButton.setTitleColor(.black, for: .normal)
        errorButton.setTitleColor(.white, for: .highlighted)
        errorButton.backgroundColor = .red
        errorButton.layer.cornerRadius = 5
        errorButton.tag = 0
        return errorButton
    }
    
    func makeSelectButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        [correctButton, errorButton].forEach( { stackView.addArrangedSubview($0)} )
        stackView.axis = .horizontal
        stackView.spacing = 50
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }
    
    func makeQuestionIndexLabel() -> UILabel {
        let questionIndexLabel = UILabel()
        questionIndexLabel.font = UIFont.systemFont(ofSize: 20)
        questionIndexLabel.text = "1/\(questions.count)"
        questionIndexLabel.textColor = UIColor(named: "textColor")
        questionIndexLabel.textAlignment = .center
        return questionIndexLabel
    }
    
    func makeScoreLabel() -> UILabel {
        let scoreLabel = UILabel()
        scoreLabel.font = UIFont.systemFont(ofSize: 20)
        scoreLabel.text = "得分：0"
        scoreLabel.textColor = UIColor(named: "textColor")
        scoreLabel.textAlignment = .center
        scoreLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 24)
        return scoreLabel
    }
    
    func makeBottomStackView() -> UIStackView {
        let stackView = UIStackView()
        [questionIndexLabel, scoreLabel].forEach( { stackView.addArrangedSubview($0)} )
        stackView.axis = .horizontal
        stackView.spacing = UIScreen.main.bounds.width * 0.5
        stackView.alignment = .bottom
        stackView.distribution = .fill
        return stackView
    }

    func makeProgressBar() -> UIView {
        let bar = UIView()
        bar.backgroundColor = .yellow
        return bar
    }
    
    @objc func onClicked(_ sender: AnyObject?) {
        let btn = sender as? UIButton
        let currentQuestion = questions[index]
        
        nextQuestion()
        
        if ((btn?.tag == 0 && !currentQuestion.answer) || (btn?.tag == 1 && currentQuestion.answer)) {
            score += 1
        }
        
    }
    
    func nextQuestion() {
        index = min(index + 1, questions.count - 1)
        if index == questions.count - 1 {
            var alert = UIAlertController(title: "漂亮", message: "你已经完成了全部题目！ 是否再来一遍？", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "再来一遍", style: .default, handler: { _ in
                self.index = 0
                self.score = 0
            }))
            alert.addAction(UIAlertAction(title: "来个屁", style: .destructive))
            self.present(alert, animated: true)
            
        }
        questionLabel.text = questions[index].text
    }
    
}

