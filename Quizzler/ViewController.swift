//
//  ViewController.swift
//  Quizzler
//
//  Created by anthony monfort on 10/5/18.
//  Copyright © 2018 Anthony Monfort. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    // IBOutlet UI Elements
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    // variables
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }


    // This method is called when an answer is pressed
    @IBAction func answerPressed(_ sender: AnyObject) {
        
    
        if sender.tag == 1 {
            pickedAnswer = true
        }
        
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        
        // calls updateUI function to update viewcontroller
        updateUI()
    }
    
    // This method will update the progress bar and score
    func updateUI() {
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
        progressLabel.text = String(questionNumber) + "/13"
        
        scoreLabel.text = "Score: " + String(score)
      
        nextQuestion()
    }

    // This method will update the question text and check if we reached the end
    func nextQuestion() {
        
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
        }
        else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { UIAlertAction in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    // This method will check if the user has got the right answer
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {

            ProgressHUD.showSuccess("Correct!")
            score = score + 1
        }
        else {
            ProgressHUD.showError("Wrong!")
        }
    }
    
    // This method will wipe the board clean, so that users can retake the quiz
    func startOver() {
       
        questionNumber = 0
        score = 0
        
        updateUI()
    }
    
    
}
