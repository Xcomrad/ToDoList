
import UIKit
import UserNotifications

protocol DataManager {
    func saveItem()
    func getItem() -> [Item]
}

class DataManagerImpl: DataManager {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "Items"
    var items: [Item] = []
    
    //MARK: - Public save/get
    func saveItem() {
        
        do {
            let data = try encoder.encode(items)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func getItem() -> [Item] {
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<Item>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
    
     //MARK: - TableView Methods
    func moveItem(fromIndex: Int, toIndex: Int) {
        let source = items[fromIndex]
        items.remove(at: fromIndex)
        items.insert(source, at: toIndex)
    }
}
