
import UIKit
import SnapKit

final class MainController: UIViewController {
    
    private let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItems()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        mainView.dataManager.items = mainView.dataManager.getItem()
    }
}



extension MainController {
    
    func setupNavItems() {
        title = "To-Do List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        addButton.tintColor = .white
        
//        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTasks))
//        editButton.tintColor = .white
        
        navigationItem.rightBarButtonItem = addButton
        //navigationItem.leftBarButtonItem = editButton
    }
    
    @objc func addNewTask() {
        let alertController = UIAlertController(title: "Новая Заметка",
                                                message: "Введите название заметки",
                                                preferredStyle: .alert)
        alertController.addTextField()
        
        let addAction = UIAlertAction(title: "Добавить", style: .default) { _ in
            if let title = alertController.textFields?.first?.text, !title.isEmpty {
                
                let newItem = Model(id: UUID(), title: title, isCompleted: false)
                self.mainView.dataManager.items.append(newItem)
                self.mainView.tableView.insertRows(at: [IndexPath(row: self.mainView.dataManager.items.count - 1,
                                                                  section: 0)], with: .automatic)
                self.mainView.dataManager.saveItem()
                
                UIView.animate(withDuration: 0.3) {
                    self.mainView.tableView.layoutIfNeeded()
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

