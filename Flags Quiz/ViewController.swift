//
//  ViewController.swift
//  Flags Quiz
//
//  Created by Karlo Fabijanić on 28.01.2022..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstFlagButton: UIButton!
    @IBOutlet weak var secondFlagButton: UIButton!
    @IBOutlet weak var thirdFlagButton: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        countries += ["estonia", "france", "germany", "ireland", "italy",
        "monaco", "nigeria", "poland", "russia", "spania", "uk", "us"]
        
        setButtonDesign()
        startGame()
    }
    
    func setButtonDesign(){
        firstFlagButton.layer.borderWidth = 1
        secondFlagButton.layer.borderWidth = 1
        thirdFlagButton.layer.borderWidth = 1
        
        firstFlagButton.layer.borderColor = UIColor.lightGray.cgColor
        secondFlagButton.layer.borderColor = UIColor.lightGray.cgColor
        thirdFlagButton.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func startGame(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        firstFlagButton.setImage(UIImage(named: countries[0]), for: .normal)
        secondFlagButton.setImage(UIImage(named: countries[1]), for: .normal)
        thirdFlagButton.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func flagTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: startGame))
        
        present(ac, animated: true)
    }
}

