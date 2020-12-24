import UIKit

class LibraryViewController: UIViewController {
    
    var images = [UIImage]()
    var numbers = [Int]()
    var startNumber = 0
    var stopNumber = 0
    
    enum RegimeOfVisualization {
        case codes, numbers, payingCards, months
    }

    @IBOutlet weak var LibraryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LibraryCollectionView.dataSource = self
        LibraryCollectionView.delegate = self
        
        for i in startNumber...stopNumber {
            let image = UIImage(named: String(i) + ".jpeg")!
            images.append(image)
            numbers.append(i)
        }
        
        let backGroundImage = UIImageView(frame: UIScreen.main.bounds)
        
        
        backGroundImage.image = UIImage(named: "background.jpg")
        backGroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        self.LibraryCollectionView?.backgroundView = backGroundImage
    
    }

}

extension LibraryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = LibraryCollectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCollectionViewCell
        
        let image = images[indexPath.item]
        
        cell.photoView.image = image
        cell.photoName.text = String(numbers[indexPath.item])
        
        return cell
    }
    
    
}
