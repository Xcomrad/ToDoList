
import Foundation

protocol DataManager {
    func saveItem()
    func getItem() -> [Model]
}

class DataManagerImpl: DataManager {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private let key = "Items"
    var items: [Model] = []

    //MARK: - Public
    func saveItem() {

        do {
            let data = try encoder.encode(items)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
   
    func getItem() -> [Model] {

        guard let data = UserDefaults.standard.data(forKey: key) else { return [] }
        do {
            let array = try decoder.decode(Array<Model>.self, from: data)
            return array
        } catch {
            print(error)
        }
        return []
    }
}
