//
//  ViewController.swift
//  QuestionAndAnswers
//
//  Created by 澈水 on 2022/4/3.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var titleLabel: UILabel = makeTitleLabel()
    lazy var questionLabel: UILabel = makeQuestionLabel()
    lazy var correctButton: UIButton = makeCorrectButton()
    lazy var errorButton: UIButton = makeErrorButton()
    lazy var selectButtonStackView: UIStackView = makeSelectButtonStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    func setupUI(){
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(200)
        }
        
        view.addSubview(questionLabel)
        questionLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
        }
        
        view.addSubview(selectButtonStackView)
        selectButtonStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(questionLabel.snp.bottom).offset(100)
        }
    }
    
    func makeTitleLabel() -> UILabel {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 50)
        titleLabel.text = "无奖问答"
        titleLabel.textColor = .black
        return titleLabel
    }
    
    func makeQuestionLabel() -> UILabel {
        let questionLabel = UILabel()
        questionLabel.font = UIFont.systemFont(ofSize: 50)
        questionLabel.text = "问题标签"
        questionLabel.textColor = .black
        return questionLabel
    }
    
    func makeCorrectButton() -> UIButton {
        let correctButton = UIButton()
        correctButton.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(400)
        }
        correctButton.setTitle("是", for: .normal)
        return correctButton
    }
    
    func makeErrorButton() -> UIButton {
        let errorButton = UIButton()
        errorButton.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(400)
        }
        errorButton.setTitle("是", for: .normal)
        return errorButton
    }
    
    func makeSelectButtonStackView() -> UIStackView {
        let stackView = UIStackView()
        [correctButton, errorButton].forEach( { stackView.addArrangedSubview($0)} )
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }

}

