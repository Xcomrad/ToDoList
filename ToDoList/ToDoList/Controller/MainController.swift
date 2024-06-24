
import UIKit
import SnapKit

class MainController: UIViewController {
    
    private let mainView = MainView()
    private let model = Model()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSettings()
    }
    
    func update() {
        mainView.toDoItems = model.toDoItems
        mainView.tableView.reloadData()
    }
}



extension MainController {
    
    func navBarSettings() {
        title = "ToDo Items"
        
        let addAction = UIAction { _ in
            self.model.addItem(nameItem: "New Item")
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: addAction)
    }
}
