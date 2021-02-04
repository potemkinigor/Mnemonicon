import UIKit

class LibraryButtonViewController: UIViewController {

    @IBOutlet weak var numbersButton: UIButton!
    @IBOutlet weak var englishAplhabet: UIButton!
    @IBOutlet weak var monthsButton: UIButton!
    @IBOutlet weak var weeksButton: UIButton!
    
    enum Regimes {
        case none, englishAlphabet, months, weeks
    }
    
    var lowerGrade = 0
    var upperGrade = 0
    var regime: Regimes = .none
    
    func updateButtonVisual () {
     
        numbersButton.layer.cornerRadius = 10
        numbersButton.layer.borderWidth = 0
        
        englishAplhabet.layer.cornerRadius = 10
        englishAplhabet.layer.borderWidth = 0
        
        monthsButton.layer.cornerRadius = 10
        monthsButton.layer.borderWidth = 0
        
        weeksButton.layer.cornerRadius = 10
        weeksButton.layer.borderWidth = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        updateButtonVisual()
        
        
        backGroundImage.image = UIImage(named: "background.jpg")
        backGroundImage.contentMode = UIView.ContentMode.scaleAspectFill

        self.view.insertSubview(backGroundImage, at: 0)
        
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
    
        let destinationController = segue.destination as! LibraryViewController
        
        destinationController.startNumber = lowerGrade
        destinationController.stopNumber = upperGrade
        
        print(regime)
        
        switch regime {
        case .englishAlphabet:
            destinationController.currentRegime = .englishAplhabet
        case .months:
            destinationController.currentRegime = .months
        case .weeks:
            destinationController.currentRegime = .weeks
        case .none:
            print("Пусто")
        }
        
        regime = Regimes.none
        
        navigationController?.pushViewController(destinationController, animated: true)
        
    }
    
    
    @IBAction func numbersButtonPush(_ sender: Any) {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryPopUpWindowViewController") as! LibraryPopUpWindowViewController
        
        self.addChild(popUpVC)
        self.view.addSubview(popUpVC.view)
        
        popUpVC.didMove(toParent: self)
        
    }
    
    @IBAction func weeksButtonPush(_ sender: Any) {
        regime = .weeks
    }
    
    @IBAction func englishAlphabetPush(_ sender: Any) {
        regime = .englishAlphabet
    }
    
    @IBAction func monthsButtonPush(_ sender: Any) {
        regime = .months
    }
    
    
    
}
