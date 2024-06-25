
import Foundation

struct Item: Codable {
    let id: UUID
    let title: String
    var isCompleted: Bool
}

