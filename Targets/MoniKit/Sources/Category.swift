import Foundation
import SwiftData

@Model
final class Category {
  @Attribute(.unique) var name: String
  var emoji: String
  var type: EntryType

  init(name: String, emoji: String, type: EntryType) {
    self.name = name
    self.emoji = emoji
    self.type = type
  }
}
