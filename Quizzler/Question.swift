//
//  Question.swift
//  Quizzler
//
//  Created by anthony monfort on 10/5/18.
//  Copyright © 2018 Anthony Monfort. All rights reserved.
//

import Foundation

class Question {
    
    let answer : Bool
    let questionText : String
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}

