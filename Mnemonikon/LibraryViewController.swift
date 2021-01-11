import UIKit

class LibraryViewController: UIViewController {
    
    enum RegimeOfVisualization {
        case numbers, englishAplhabet, months, weeks
    }
    
    var images = [UIImage]()
    var numbers = [Int]()
    var startNumber = 0
    var stopNumber = 0
    var currentRegime: RegimeOfVisualization = .numbers
    
    let englishAlphabet = [
        1 : "A",
        2 : "B",
        3 : "C",
        4 : "D",
        5: "E",
        6 : "F",
        7 : "G",
        8 : "H",
        9 : "I",
        10 : "J",
        11 : "K",
        12 : "L",
        13 : "M",
        14 : "N",
        15 : "O",
        16 : "P",
        17 : "Q",
        18 : "R",
        19 : "S",
        20 : "T",
        21 : "U",
        22 : "V",
        23 : "W",
        24 : "X",
        25 : "Y",
        26 : "Z"
    ]
    
    let monthsDict = [
        1 : "January",
        2 : "February",
        3 : "March",
        4 : "April",
        5 : "May",
        6 : "June",
        7 : "July",
        8 : "August",
        9 : "September",
        10 : "October",
        11 : "November",
        12 : "December",
    ]
    
    let weeksDict = [
        1 : "Monday",
        2 : "Tuesady",
        3 : "Wensday",
        4 : "Thursday",
        5 : "Friday",
        6 : "Saturday",
        7 : "Sunday",
    ]
    


    @IBOutlet weak var LibraryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LibraryCollectionView.dataSource = self
        LibraryCollectionView.delegate = self
        
        switch currentRegime {
        case .numbers:
            for i in startNumber...stopNumber {
                let image = UIImage(named: String(i) + ".jpeg")!
                images.append(image)
                numbers.append(i)
            }
        case .englishAplhabet:
            for i in 1...26 {
                let image = UIImage(named: "p_0" + String(i) + ".jpg")!
                images.append(image)
            }
        case .months:
            for i in 1...12 {
                let image = UIImage(named: "M" + String(i) + ".jpg")!
                images.append(image)
            }
        case .weeks:
            for i in 1...7 {
                let image = UIImage(named: "W" + String(i) + ".jpg")!
                images.append(image)
            }
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
        
        switch currentRegime {
        case .numbers:
            cell.photoName.text = String(numbers[indexPath.item])
        case .englishAplhabet:
            cell.photoName.text = englishAlphabet[indexPath.item + 1]
        case .months:
            cell.photoName.text = monthsDict[indexPath.item + 1]
        case .weeks:
            cell.photoName.text = weeksDict[indexPath.item + 1]
        }
        return cell
    }
    
    
}
