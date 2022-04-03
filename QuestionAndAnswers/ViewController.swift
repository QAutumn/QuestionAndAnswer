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
    
    var index: Int = 1 {
        didSet {
            questionIndexLabel.text = "\(index)/13"
            progrcessBar.frame.size.width = UIScreen.main.bounds.width / 13 * CGFloat(index)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        correctButton.addTarget(self, action: "onClicked:", for: .touchUpInside)
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
            make.centerX.equalToSuperview()
            make.top.equalTo(selectButtonStackView.snp.bottom).offset(100)
        }
        
        view.addSubview(progrcessBar)
        progrcessBar.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(bottomStackView).offset(10)
            make.height.equalTo(20)
            make.width.equalTo(0)
        }
        
    }
    
    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.text = "无奖问答"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }
    
    func makeQuestionLabel() -> UILabel {
        let questionLabel = UILabel()
        questionLabel.font = UIFont.systemFont(ofSize: 20)
        questionLabel.text = "问题标签"
        questionLabel.textColor = .black
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
        questionIndexLabel.text = "1/13"
        questionIndexLabel.textColor = .black
        questionIndexLabel.textAlignment = .center
        return questionIndexLabel
    }
    
    func makeScoreLabel() -> UILabel {
        let scoreLabel = UILabel()
        scoreLabel.font = UIFont.systemFont(ofSize: 20)
        scoreLabel.text = "得分：0"
        scoreLabel.textColor = .black
        scoreLabel.textAlignment = .center
        return scoreLabel
    }
    
    func makeBottomStackView() -> UIStackView {
        let stackView = UIStackView()
        [questionIndexLabel, scoreLabel].forEach( { stackView.addArrangedSubview($0)} )
        stackView.axis = .horizontal
        stackView.spacing = UIScreen.main.bounds.width * 0.7
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }

    func makeProgressBar() -> UIView {
        let bar = UIView()
        bar.backgroundColor = .yellow
        return bar
    }
    
    func onClicked(_ sender: Any) {
        index += 1
    }
}

