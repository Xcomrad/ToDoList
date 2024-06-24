
import UIKit
import SnapKit

class MainController: UIViewController {
    
    var items: [Model] = []
    
    private let mainView = MainView()
    private let dataManager = DataManager()
    private let itemsManager = ItemsManager()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarSettings()
        setbarButtons()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        items = itemsManager.toDoItems
    }
}



extension MainController {
    
    func navBarSettings() {
        title = "ToDo Items"
    }
    
    func setbarButtons() {
        let addAction = UIAction { _ in
            self.items.append(Model(id: UUID(), name: "New Item"))
            self.mainView.tableView.reloadData()
        }
        let addButton = UIBarButtonItem(systemItem: .add, primaryAction: addAction)
        navigationItem.rightBarButtonItem = addButton
    }
}
