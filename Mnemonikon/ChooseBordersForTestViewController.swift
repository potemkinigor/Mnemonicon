//
//  ChooseBordersForTestViewController.swift
//  Mnemonikon
//
//  Created by Igor Potemkin on 24.12.2020.
//

import UIKit

let bordersFrom = [0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950]
let bordersTo = [50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650, 700, 750, 800, 850, 900, 950, 1000]

var lowerBorderSelected = 0
var upperBorderSelected = 0

class ChooseBordersForTestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var PushButton: UIButton!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == PickerFrom {
            return bordersFrom.count
        } else {
            return bordersTo.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == PickerFrom {
            return String(bordersFrom[row])
        } else {
            return String(bordersTo[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == PickerFrom {
            lowerBorderSelected = bordersFrom[row]
            if lowerBorderSelected > upperBorderSelected {
                PickerTo.selectRow(row, inComponent: 0, animated: true)
                upperBorderSelected = bordersTo[row]
            }
        } else {
            upperBorderSelected = bordersTo[row]
            if lowerBorderSelected > upperBorderSelected {
                PickerFrom.selectRow(row, inComponent: 0, animated: true)
                lowerBorderSelected = bordersFrom[row]
            }
        }
    }
    
    @IBOutlet weak var PickerFrom: UIPickerView!
    @IBOutlet weak var PickerTo: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        PickerFrom.dataSource = self
        PickerFrom.delegate = self
        
        PickerTo.dataSource = self
        PickerTo.delegate = self
        
        lowerBorderSelected = bordersFrom[0]
        upperBorderSelected = bordersTo[0]
        
        PushButton.layer.cornerRadius = 10
        PushButton.layer.borderWidth = 0
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
    
        backGroundImage.image = UIImage(named: "background.jpg")
        backGroundImage.contentMode = UIView.ContentMode.scaleAspectFill

        self.view.insertSubview(backGroundImage, at: 0)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationController = segue.destination as? ViewController
        
        destinationController?.LowerBorderOfGuessing = lowerBorderSelected
        destinationController?.UpperBorderOfGuessing = upperBorderSelected
    }
    
}
