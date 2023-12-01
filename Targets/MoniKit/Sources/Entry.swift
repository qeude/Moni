import Foundation
import SwiftData

@Model
final class Entry {
  @Attribute(.unique) var id: UUID
  var type: EntryType
  var date: Date
  var amount: Double
  var name: String?
  var detail: String?

  init(type: EntryType, date: Date, amount: Double, name: String? = nil, detail: String? = nil) {
    self.id = UUID()
    self.type = type
    self.date = date
    self.amount = amount
    self.name = name
    self.detail = detail
  }
}

enum EntryType {
  case expense, income
}
