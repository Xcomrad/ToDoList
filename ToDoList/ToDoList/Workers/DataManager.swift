
import Foundation

class DataManager {
    
    private var userDefaults = UserDefaults(suiteName: "items")
    private let itemsKey: String = "saved_items"
    
    func saveItems(_ items: [Model]) {
    
        do {
            let decoder = JSONEncoder()
            let itemsData = try decoder.encode(items)
            userDefaults?.setValue(itemsData, forKey: itemsKey)
        } catch {
            print("\(error)")
        }
    }
    
    func getItems() -> [Model] {
        
        guard let itemsData = userDefaults?.data(forKey: itemsKey) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let items = try decoder.decode([Model].self, from: itemsData)
            return items
        } catch {
            print("\(error)")
        }
        return []
    }
}
