//
//  ViewController.swift
//  QuizzSchoolApp
//
//  Created by didier arrigoni on 14.09.18.
//  Copyright © 2018 Didier Arrigoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets et variables
    
    @IBOutlet weak var questionView: QuestionView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var newGameButton: UIButton!
    var game = Game()
    
    
    // MARK: - Méthodes override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // pour être sûr de bien écouter les notifications reçues dès que le controleur est chargé
        // D'abord on veut obtenir le nom de la notification - (chaque notification est unique)
        let name = Notification.Name(rawValue: "QuestionsLoaded")
        // La classe chargée de recevoir les notifications est NotificationCenter
        // la méthode qui permet d'écouter les notifications est addObserver
        NotificationCenter.default.addObserver(self, selector: #selector(questionsLoaded), name: name, object: nil)
        
        startNewGame()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - La logique
    private func startNewGame() {
        activityIndicator.isHidden = false
        newGameButton.isHidden = true
        
        questionView.title = "Chargement en cours ..."
        questionView.style = .enAttente
        
        scoreLabel.text = " 0 / 10"
        
        // Implémenter le chargement des questions ...
    }
    @objc func questionsLoaded() {
        activityIndicator.isHidden = true
        newGameButton.isHidden = false
        
        questionView.title = game.currentQuestion.title
    }
    
    // MARK: - Les actions
    @IBAction func diTapNewGameButton() {
    }
    
    
    

}

