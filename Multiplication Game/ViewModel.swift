//
//  ViewModel.swift
//  Multiplication Game
//
//  Created by Hanna Cherniakova on 29/04/2023.
//

import SwiftUI
import Foundation

class ViewModel: ObservableObject {
    @Published var number = 0
    @Published var numberOfQuestions = 0
    @Published var isGameStarted = false
    @Published var isAlertShowing = false
    @Published var score = 0
    @Published var answer = 0
    @Published var message = ""
    @Published var question = ""
    @Published var randomNumber = Int.random(in: 0...10)
    @Published var askedTimes = 0
    
    var correctAnswer: Int {
        randomNumber * number
    }
    
    func checkAnswer() {
        if correctAnswer == answer {
            score += 1
            message = "🐵 Yep! You're right!"
        }else {
            score -= 1
            message = "🙈 Nah! The answer is \(correctAnswer)."
        }
        
        isAlertShowing = true
        answer = 0
        randomNumber = Int.random(in: 1...10)
        questionsGenerator()
        
        if askedTimes == numberOfQuestions {
            message = "🐒 This was the last question. Thank you for the game!"
        }
    }
    
    func questionsGenerator() {
        question = "What is \(number) * \(randomNumber)?"
        askedTimes += 1
    }
}

