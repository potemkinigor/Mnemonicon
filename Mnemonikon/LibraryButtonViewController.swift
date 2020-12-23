import UIKit

class LibraryButtonViewController: UIViewController {

    @IBOutlet weak var ZeroNinetyNine: UIButton!
    @IBOutlet weak var OneHundredOnehundredNinetyNine: UIButton!
    
    var lowerGrade = 0
    var upperGrade = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
    
        let destinationController = segue.destination as! LibraryViewController
        
        destinationController.startNumber = lowerGrade
        destinationController.stopNumber = upperGrade
        
        navigationController?.pushViewController(destinationController, animated: true)
        
    }
    
    @IBAction func TapZeroNinetyNine(_ sender: Any) {
        lowerGrade = 0
        upperGrade = 99
        
    }
    
    @IBAction func CodesRulesShow(_ sender: Any) {
        print("Хреня какая-то")
    }
    
    
    @IBAction func TapOneHundredOnehundredNinetyNine(_ sender: Any) {
        lowerGrade = 100
        upperGrade = 199
    }
}
