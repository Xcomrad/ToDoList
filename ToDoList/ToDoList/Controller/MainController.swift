
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
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        items = itemsManager.toDoItems
    }
}



extension MainController {
    
    func navBarSettings() {
        title = "To-Do Items"
       
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        navigationItem.rightBarButtonItem = addButton
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
   @objc func addNewTask() {
       let alertController = UIAlertController(title: "Новая Заметка",
                                               message: "Введите название заметки",
                                               preferredStyle: .alert)
               alertController.addTextField()
               
               let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
                   if let title = alertController.textFields?.first?.text, !title.isEmpty {
                       let newItem = Model(id: UUID(), title: title, isCompleted: false)
                       self.items.append(newItem)
                       self.mainView.tableView.insertRows(at: [IndexPath(row: self.items.count - 1, section: 0)], with: .automatic)
                       self.dataManager.saveItems([newItem])
                   }
               }
               let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
               
               alertController.addAction(addAction)
               alertController.addAction(cancelAction)
               
               present(alertController, animated: true, completion: nil)
    }
}
