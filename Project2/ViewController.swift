//
//  ViewController.swift
//  Project2
//
//  Created by Graphic Influence on 11/07/2019.
//  Copyright © 2019 marianne massé. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia","france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
        
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = """
        Guess: \(countries[correctAnswer].uppercased()) / Your score is: \(score)
        """
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        endGame()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        questionAsked += 1
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
           
        } else {
            title = "Wrong, that's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
            
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
    }
    func endGame() {
        if questionAsked == 10 {
            let ac2 = UIAlertController(title: "Game over", message: "Your final score is \(score)", preferredStyle: .alert)
            ac2.addAction(UIAlertAction(title: "Ok", style: .default, handler: askQuestion))
            present(ac2, animated: true)
            resetGame()
        }
    }
    func resetGame() {
        score = 0
        questionAsked = 0
    }
}

