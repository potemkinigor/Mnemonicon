//
//  LibraryPopUpWindowViewController.swift
//  Mnemonikon
//
//  Created by Igor Potemkin on 25.12.2020.
//

import UIKit

class LibraryPopUpWindowViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var PopUpView: UIView!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var valuesPicker: UIPickerView!
    let pickingDictionaryForNumber: [(String, Int)] = [
    ("0 - 99", 99),
    ("100 - 199", 199),
    ("200 - 299", 299),
    ("300 - 399", 399),
    ("400 - 499", 499),
    ("500 - 599", 599),
    ("600 - 699", 699),
    ("700 - 799", 799),
    ("800 - 899", 899),
    ("900 - 999", 999)
    ]
    
    var lowerBorderNumber = 0
    var upperBorderNumber = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PopUpView.layer.cornerRadius = 24
        
        chooseButton.layer.cornerRadius = 10
        chooseButton.layer.borderWidth = 0
        
        valuesPicker.dataSource = self
        valuesPicker.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickingDictionaryForNumber.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickingDictionaryForNumber[row].0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        upperBorderNumber = pickingDictionaryForNumber[row].1
        lowerBorderNumber = upperBorderNumber - 99
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as? LibraryViewController
        
        destinationController?.startNumber = lowerBorderNumber
        destinationController?.stopNumber = upperBorderNumber
        destinationController?.currentRegime = .numbers
        
    }

    @IBAction func closePopUpWindow(_ sender: Any) {
        self.view.removeFromSuperview()
    }
    
    @IBAction func chooseNumbersToShow(_ sender: Any) {
        
    }
}
