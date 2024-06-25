
import UIKit

class MainView: UIView {
    
    let dataManager = DataManagerImpl()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        tableView.rowHeight = 60
        tableView.backgroundColor = .systemGray6
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        let toDoItem = dataManager.items[indexPath.row]
        cell.update(toDoItem)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, completionHandler) in
            self.dataManager.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.dataManager.saveItem()
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        dataManager.moveItem(fromIndex: sourceIndexPath.row, toIndex: destinationIndexPath.row)
        tableView.reloadData()
        dataManager.saveItem()
    }
}



extension MainView: TableViewCellDelegate {
    func didToggleComplete(for item: Item) {
        if let index = dataManager.items.firstIndex(where: { $0.id == item.id }) {
            dataManager.items[index].isCompleted.toggle()
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
            dataManager.saveItem()
        }
    }
}



extension MainView {
    
    func setup() {
        backgroundColor = .systemGray6
    }
    
    func setupViews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
