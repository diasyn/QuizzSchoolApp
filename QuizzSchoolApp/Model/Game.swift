//
//  Game.swift
//  OpenQuizz
//
//  Created by Ambroise COLLON on 13/06/2017.
//  Copyright Â© 2017 OpenClassrooms. All rights reserved.
//

import Foundation

// Cettte classe permet de gérer l'intégralité de la partie, donc beaucoup de logique, d'où la création d'une classe.
class Game {
    
    // MArk: - Les variables
    var score = 0
    
    private var questions = [Question]()
    private var currentIndex = 0
    
    var state: State = .ongoing
    
    enum State {
        case ongoing, over
    }
    
    var currentQuestion: Question {
        return questions[currentIndex]
    }
    
    // MARK: - Les fonctions
    
    func refresh() {
        score = 0
        currentIndex = 0
        state = .over
        
        // c'est le système du Patterne Singleton > shared est une instance unique de QuestionManager
        QuestionManager.shared.get{ (questions) in // cette closure gère les questions reçues > cette fonction va être placée en paramètre de la fonction get de QuestionManager.swift
            self.questions = questions
            self.state = .ongoing
            
            // émission de la notification > comme une radio !
            let name = Notification.Name(rawValue: "QuestionsLoaded")
            let notification = Notification(name: name)
            NotificationCenter.default.post(notification)
            
        }
    }
    
    func answerCurrentQuestion(with answer: Bool) {
        if (currentQuestion.isCorrect && answer) || (!currentQuestion.isCorrect && !answer) {
            score += 1
        }
        goToNextQuestion()
    }
    
    private func goToNextQuestion() {
        if currentIndex < questions.count - 1 {
            currentIndex += 1
        } else {
            finishGame()
        }
    }
    
    private func finishGame() {
        state = .over
    }
}
