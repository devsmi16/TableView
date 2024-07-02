import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedSimpson : Simpson?
    var selectedSimpsonImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        nameLabel.text = selectedSimpson?.name
        jobLabel.text = selectedSimpson?.job
        imageView.image = selectedSimpson?.image
       
    }
}
