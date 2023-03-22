//
//  Question.swift
//  QuizApp
//
//  Created by 邱奕軒 on 2023/3/15.
//

import Foundation

struct Question: Codable {
    var questionName: String?
    var choices:[String]?
    var correctAnswerIndex: Int?
    var feedback: String?
}
