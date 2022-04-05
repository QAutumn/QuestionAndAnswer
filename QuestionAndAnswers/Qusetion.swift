//
//  Qusetion.swift
//  QuestionAndAnswers
//
//  Created by 澈水 on 2022/4/4.
//

import Foundation

class Qusetion {
    var text: String
    var answer: Bool
    
    init(_ text: String, _ answer: Bool){
        self.text = text
        self.answer = answer
    }
}
var questions: [Qusetion] = [
    Qusetion("马云是中国首富", true),
    Qusetion("1", false),
    Qusetion("2", false),
    Qusetion("3", false),
    Qusetion("4", false),
    Qusetion("5", false),
    Qusetion("6", false),
    Qusetion("7", false),
    Qusetion("8", false),
    Qusetion("9", false),
    Qusetion("10", false),
    Qusetion("11", false),
    Qusetion("12", false),
    Qusetion("13", false),
    Qusetion("14", false),
    Qusetion("15", false),
    Qusetion("16", false),
    Qusetion("17", false),
    Qusetion("18", false),
    Qusetion("19", false),
    Qusetion("20", false)
]
