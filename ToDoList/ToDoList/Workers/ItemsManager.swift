
import Foundation

class ItemsManager {
    
    var toDoItems: [Model] = [
        Model(id: UUID(), title: "Рефакторинг кода", isCompleted: false),
        Model(id: UUID(), title: "Провести ревью", isCompleted: true),
        Model(id: UUID(), title: "Залить на прод", isCompleted: false),
    ]
    
    func addItem(item: Model) {
        toDoItems.append(item)
    }
    
    func removeItem(at index: Int) {
        toDoItems.remove(at: index)
    }
}
