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
    @IBOutlet weak var correctUnswersCountLabel: UILabel!
    

    
    
    var numberAndImageDict: [Int : String] = [:]
    var userCorrentAnswersCount = 0
    let numbersLimit = 99
    // x, y, width, height:
    var picturesCoordinatesArray = [(20, 140, 183, 142),
                                     (211, 140, 183, 142),
                                     (20, 345, 183, 142),
                                     (211, 345, 183, 142)
                                    ]
    var picture2CoordinatesArray = [Int]()
    var picture3CoordinatesArray = [Int]()
    var picture4CoordinatesArray = [Int]()
    var imageViewsArray: [UIImageView] = []
    var correctPictureNumber = 0
    var userAnswer = 0
    
    func updatePictures () {
        
        numberAndImageDict.removeAll()
        
        var randomNumber = arc4random_uniform(UInt32(numbersLimit))
        imageViewsArray = [RandomImage1, RandomImage2, RandomImage3, RandomImage4]
        
        for _ in 1...4 {
            numberAndImageDict[Int(randomNumber)] =  String(Int(randomNumber)) + ".jpeg"
            randomNumber = arc4random_uniform(UInt32(numbersLimit))
        }
        
        RandomNumberLabel.text = String(numberAndImageDict.randomElement()!.key)
        
        var i = 0
        for (_, picture) in numberAndImageDict {
            imageViewsArray[i].image = UIImage(named: picture)
            
            if RandomNumberLabel.text! == picture.dropLast(5) {
                correctPictureNumber = i + 1
            }
            
            i += 1
        }
        
        i = 0
        
        for element in imageViewsArray {
            element.frame = CGRect(x: picturesCoordinatesArray[i].0, y: picturesCoordinatesArray[i].1, width: picturesCoordinatesArray[i].2, height: picturesCoordinatesArray[i].3)
            i += 1
        }
        
    }
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(didTapImageView1(_:)))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(didTapImageView2(_:)))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(didTapImageView3(_:)))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(didTapImageView4(_:)))

        RandomImage1.addGestureRecognizer(tapGestureRecognizer1)
        RandomImage2.addGestureRecognizer(tapGestureRecognizer2)
        RandomImage3.addGestureRecognizer(tapGestureRecognizer3)
        RandomImage4.addGestureRecognizer(tapGestureRecognizer4)
        
        
        updatePictures()
        
    }
    
    @ objc func didTapImageView1(_ sender: UITapGestureRecognizer) {
        
        var newHeight = 0
        var newWidth = 0
        
        if Int(RandomImage1.frame.width) == picturesCoordinatesArray[0].2 && Int(RandomImage1.frame.height) == picturesCoordinatesArray[0].3 {
            newHeight = picturesCoordinatesArray[0].3 * 7 / 5
            newWidth = picturesCoordinatesArray[0].2 * 7 / 5
            
            makeOtherPicturesSmallAgain(picture: RandomImage1)
                        
        } else {
            newHeight = picturesCoordinatesArray[0].3
            newWidth = picturesCoordinatesArray[0].2
        }
        
        RandomImage1.frame = CGRect(x: picturesCoordinatesArray[0].0, y: picturesCoordinatesArray[0].1, width: newWidth, height: newHeight)
        userAnswer = 1
        

    }
    
    @ objc func didTapImageView2(_ sender: UITapGestureRecognizer) {
        var newHeight = 0
        var newWidth = 0
        
        if Int(RandomImage2.frame.width) == picturesCoordinatesArray[1].2 && Int(RandomImage2.frame.height) == picturesCoordinatesArray[1].3 {
            newHeight = picturesCoordinatesArray[1].3 * 7 / 5
            newWidth = picturesCoordinatesArray[1].2 * 7 / 5
            
            makeOtherPicturesSmallAgain(picture: RandomImage2)
            
        } else {
            newHeight = picturesCoordinatesArray[1].3
            newWidth = picturesCoordinatesArray[1].2
        }
        
        RandomImage2.frame = CGRect(x: picturesCoordinatesArray[1].0, y: picturesCoordinatesArray[1].1, width: newWidth, height: newHeight)
        userAnswer = 2
    }
    
    @ objc func didTapImageView3(_ sender: UITapGestureRecognizer) {
        var newHeight = 0
        var newWidth = 0
        
        if Int(RandomImage3.frame.width) == picturesCoordinatesArray[2].2 && Int(RandomImage3.frame.height) == picturesCoordinatesArray[2].3 {
            newHeight = picturesCoordinatesArray[2].3 * 7 / 5
            newWidth = picturesCoordinatesArray[2].2 * 7 / 5
            
            makeOtherPicturesSmallAgain(picture: RandomImage3)
            
        } else {
            newHeight = picturesCoordinatesArray[2].3
            newWidth = picturesCoordinatesArray[2].2
        }
        
        RandomImage3.frame = CGRect(x: picturesCoordinatesArray[2].0, y: picturesCoordinatesArray[2].1, width: newWidth, height: newHeight)
        userAnswer = 3
    }
    
    @ objc func didTapImageView4(_ sender: UITapGestureRecognizer) {
        var newHeight = 0
        var newWidth = 0
        
        if Int(RandomImage4.frame.width) == picturesCoordinatesArray[3].2 && Int(RandomImage4.frame.height) == picturesCoordinatesArray[3].3 {
            newHeight = picturesCoordinatesArray[3].3 * 7 / 5
            newWidth = picturesCoordinatesArray[3].2 * 7 / 5
            
            makeOtherPicturesSmallAgain(picture: RandomImage4)
            
        } else {
            newHeight = picturesCoordinatesArray[3].3
            newWidth = picturesCoordinatesArray[3].2
        }
        
        RandomImage4.frame = CGRect(x: picturesCoordinatesArray[3].0, y: picturesCoordinatesArray[3].1, width: newWidth, height: newHeight)
        userAnswer = 4
    }
    
    func makeOtherPicturesSmallAgain (picture: UIImageView) {
        
        var i = 0
        for element in imageViewsArray {
            if element != picture {
                element.frame = CGRect(x: picturesCoordinatesArray[i].0, y: picturesCoordinatesArray[i].1, width: picturesCoordinatesArray[i].2, height: picturesCoordinatesArray[i].3)
                i += 1
            } else {
                i += 1
            }
        }
    }
    
    @IBAction func CheckUnswer(_ sender: Any) {
             
        if userAnswer == correctPictureNumber {
            
            userCorrentAnswersCount += 1
        }
        
        correctUnswersCountLabel.text = String(userCorrentAnswersCount)
        
        updatePictures()
        
    }
    
    
    
    
    
}



