import UIKit

class MainWindowViewController: UIViewController {
    
    @IBOutlet weak var LibraryButton: UIButton!
    @IBOutlet weak var TrainingNumbersButton: UIButton!
    @IBOutlet weak var TrainingPlayingCardsButton: UIButton!
    @IBOutlet weak var TrainingMonthsButton: UIButton!
    
    func updateButtonsVisual () {
        LibraryButton.layer.cornerRadius = 10
        LibraryButton.layer.borderWidth = 0
        
        TrainingNumbersButton.layer.cornerRadius = 10
        TrainingNumbersButton.layer.borderWidth = 0
        
        TrainingPlayingCardsButton.layer.cornerRadius = 10
        TrainingPlayingCardsButton.layer.borderWidth = 0
        
        TrainingMonthsButton.layer.cornerRadius = 10
        TrainingMonthsButton.layer.borderWidth = 0
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateButtonsVisual()
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
    
        backGroundImage.image = UIImage(named: "background.jpg")
        backGroundImage.contentMode = UIView.ContentMode.scaleAspectFill

        self.view.insertSubview(backGroundImage, at: 0)
        
    }

}
