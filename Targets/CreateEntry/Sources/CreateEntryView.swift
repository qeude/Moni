import SwiftUI

public struct CreateEntryView: View {
  public var body: some View {
    VStack {
      VStack {
        HStack {
          Text("Value")
          Button(action: {}, label: {
            Text("Clear")
          })
        }
        Text("description")
      }
      .frame(maxHeight: .infinity)
      VStack {
        HStack {
          Text("Date")
          Text("Category")
        }
        NumberPadView()
          .padding()
      }
    }
  }
}

#Preview {
  CreateEntryView()
}
