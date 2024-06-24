
import Foundation

class Model {
    
    var toDoItems: [String] = ["Отрефакторить код", "Провести ревью", "Залить на прод"]
    
    func addItem(nameItem: String) {
        toDoItems.append(nameItem)
    }
    
    func removeItem(remove atIndex: Int) {
        toDoItems.remove(at: atIndex)
    }
    
    func saveData() {
        
    }
    
    func loadData() {
        
    }
}
