import UIKit

class LibraryButtonViewController: UIViewController {

    @IBOutlet weak var ZeroNinetyNine: UIButton!
    @IBOutlet weak var OneHundredOnehundredNinetyNine: UIButton!
    @IBOutlet weak var CodesButton: UIButton!
    @IBOutlet weak var TwoHundredTwohundredNinetyNine: UIButton!
    
    
    var lowerGrade = 0
    var upperGrade = 0
    
    func updateButtonVisual () {
        CodesButton.layer.cornerRadius = 10
        CodesButton.layer.borderWidth = 0
        
        
        ZeroNinetyNine.layer.cornerRadius = 10
        ZeroNinetyNine.layer.borderWidth = 0
        
        
        OneHundredOnehundredNinetyNine.layer.cornerRadius = 10
        OneHundredOnehundredNinetyNine.layer.borderWidth = 0
        
        TwoHundredTwohundredNinetyNine.layer.cornerRadius = 10
        TwoHundredTwohundredNinetyNine.layer.borderWidth = 0
        
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
        
        navigationController?.pushViewController(destinationController, animated: true)
        
    }
    
    @IBAction func TapZeroNinetyNine(_ sender: Any?) {
        lowerGrade = 0
        upperGrade = 99
        
    }
    
    @IBAction func CodesRulesShow(_ sender: Any) {
        print("Херня какая-то")
    }
    
    
    @IBAction func TapOneHundredOnehundredNinetyNine(_ sender: Any) {
        lowerGrade = 100
        upperGrade = 199
    }
}
