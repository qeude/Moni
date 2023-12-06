import Settings
import SwiftUI

public struct ContentView: View {
  @State private var selection = 0
  
  public init() {}
  
  public var body: some View {
    TabView(selection: $selection) {
      Text("Home")
        .tabItem {
          Label("Home", systemImage: "wallet.pass")
        }
        .tag(0)
      Spacer()
        .tabItem {
          EmptyView()
        }
        .tag(1)
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
        .tag(2)
    }
    .overlay(alignment: .bottom) {
      Button {
      } label: {
        Image(systemName: "plus")
          .tint(Color.white)
      }
      .frame(width: 50, height: 50)
      .background(Color.green)
      .clipShape(Circle())
    }
    .onChange(of: selection) { oldValue, newValue in
      if newValue == 1 {
        self.selection = oldValue
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
