import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var simpsonNames = [Simpson]()
    var simpsonImages = [UIImage]()
    
    var chosenSimpson : Simpson?
    var chosenSimpsonImage : UIImage?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
    
        // simpson objects
        let homer = Simpson(simpsonName: "bart simpson", simpsonJob: "student", simpsonImage: UIImage(named: "bart")!)
        let marge = Simpson(simpsonName: "homer simpson", simpsonJob: "nuclear safety", simpsonImage: UIImage(named: "homer")!)
        let bart = Simpson(simpsonName: "lisa simpson", simpsonJob: "student", simpsonImage: UIImage(named: "lisa")!)
        let lisa = Simpson(simpsonName: "maggie simpson", simpsonJob: "baby", simpsonImage: UIImage(named: "maggie")!)
        let maggie = Simpson(simpsonName: "marge simpson", simpsonJob: "house wife", simpsonImage: UIImage(named: "marge")!)

        simpsonNames.append(bart)
        simpsonNames.append(homer)
        simpsonNames.append(lisa)
        simpsonNames.append(maggie)
        simpsonNames.append(marge)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = simpsonNames[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = simpsonNames[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let destinationVC = segue.destination as! detailsVC
            destinationVC.selectedSimpson = chosenSimpson
            destinationVC.selectedSimpsonImage = chosenSimpsonImage
        }
    }
}
