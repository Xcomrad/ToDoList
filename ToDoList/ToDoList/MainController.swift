
import UIKit
import SnapKit

class MainController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
    }
    
    func setNavigation() {
        title = "ToDo Items"
    }
}

