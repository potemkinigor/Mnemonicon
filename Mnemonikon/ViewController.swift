//
//  ViewController.swift
//  Mnemonikon
//
//  Created by Igor Potemkin on 17.12.2020.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    @IBOutlet weak var RandomNumberLabel: UILabel!
    @IBOutlet weak var RandomImage1: UIImageView!
    @IBOutlet weak var RandomImage2: UIImageView!
    @IBOutlet weak var RandomImage3: UIImageView!
    @IBOutlet weak var RandomImage4: UIImageView!
    @IBOutlet weak var userAnswerText: UITextField!
    
    
    var numberAndImageDict: [Int : String] = [:]
    let numbersLimit = 10
    let correctAnswersDict = [0: "Номерок", 1: "Еж", 2: "Яд", 3: "Ухо", 4: "Чай", 5: "Обои", 6: "Юла", 7: "Оса", 8: "Ива", 9: "Яйцо", 10: "Огонь"]

    
    func updatePictures () {
        
        numberAndImageDict.removeAll()
        
        var randomNumber = arc4random_uniform(UInt32(numbersLimit))
        let imageViewsArray: [UIImageView] = [RandomImage1, RandomImage2, RandomImage3, RandomImage4]
        
        for _ in 1...4 {
            numberAndImageDict[Int(randomNumber)] =  String(Int(randomNumber)) + ".jpeg"
            randomNumber = arc4random_uniform(UInt32(numbersLimit))
        }
        
        var i = 0
        for (_, picture) in numberAndImageDict {
            imageViewsArray[i].image = UIImage(named: picture)
            i += 1
        }
        
        RandomNumberLabel.text = String(numberAndImageDict.randomElement()!.key)
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        
        RandomImage1.addGestureRecognizer(tapGestureRecognizer)
        
        updatePictures()
        
    }
    
    @ objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        print("did tap image view")
    }
    
    @IBAction func CheckUnswer(_ sender: Any) {
        
        let userAnswer = userAnswerText.text
        
        let correctAnswer = correctAnswersDict[Int(RandomNumberLabel.text!)!]
        
        if userAnswer == correctAnswer {
            userAnswerText.text = "Правильно!"
        } else {
            userAnswerText.text = "Правильный ответ - \(String(describing: correctAnswersDict[Int(RandomNumberLabel.text!)!])) "
        }
        
        updatePictures()
        
    }
    
    
    
}



