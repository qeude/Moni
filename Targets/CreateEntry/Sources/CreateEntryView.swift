import Settings
import SwiftUI

public struct CreateEntryView: View {
  @AppStorage(SettingsKey.currency.rawValue) var currency: String = Locale.current.currency!.identifier
  @State var amount: Double = 0

  public var body: some View {
    VStack {
      VStack {
        Text(amount, format: .currency(code: currency))
          .font(.largeTitle)
        Text("description")
      }
      .frame(maxHeight: .infinity)
      VStack {
        HStack {
          Text("Date")
          Text("Category")
        }
        NumberPadView(numberDisabled: amount >= 1_000_000_000) { key in
          switch key {
          case .number(let value):
            amount *= 10
            amount += Double(value) / 100
            break
          case .delete:
            amount = Double(Int(amount * 10)) / 100
          case .submit:
            break
          }
        }
        .padding()
      }
    }
  }
}

#Preview {
  CreateEntryView()
}
