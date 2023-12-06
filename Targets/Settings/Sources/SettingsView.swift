//
//  SettingsView.swift
//  Settings
//
//  Created by Quentin Eude on 04/12/2023.
//  Copyright © 2023 qeude. All rights reserved.
//

import MoniKit
import SwiftUI

public struct SettingsView: View {
  @AppStorage(SettingsKey.currency.rawValue) var currency: String = Locale.current.currency!.identifier

  public init() {}

  public var body: some View {
    NavigationStack {
      Form {
        Section("GENERAL") {
          HStack {
            Image(systemName: "coloncurrencysign.circle")
            Picker("Currency", selection: $currency) {
              ForEach(Currency.allCurrencies, id: \.code) { currency in
                HStack {
                  Text(currency.code)
                    .monospaced()
                  Text(currency.name)
                }
              }
            }
            .pickerStyle(.navigationLink)
          }
        }
      }
      .navigationTitle("Settings")
    }
  }
}

#Preview {
  SettingsView()
}
