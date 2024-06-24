
import Foundation

class ItemsManager {
    
    var toDoItems: [Model] = [
        Model(id: UUID(), name: "Рефакторинг кода"),
        Model(id: UUID(), name: "Провести ревью"),
        Model(id: UUID(), name: "Залить на прод"),
    ]
    
    func addItem(item: Model) {
        toDoItems.append(item)
    }
    
    func removeItem(at index: Int) {
        toDoItems.remove(at: index)
    }
}
