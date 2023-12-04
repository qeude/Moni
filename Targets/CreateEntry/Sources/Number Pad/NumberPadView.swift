//
//  KeyboardView.swift
//  CreateEntry
//
//  Created by Quentin Eude on 01/12/2023.
//  Copyright © 2023 qeude. All rights reserved.
//

import SwiftUI

struct NumberPadView: View {
  let keys: [[Self.Key]] = [
    [.number(1), .number(2), .number(3)],
    [.number(4), .number(5), .number(6)],
    [.number(7), .number(8), .number(9)],
    [.comma, .number(0), .submit]
  ]

  var body: some View {
    Grid {
      ForEach(keys, id: \.self) { row in
        GridRow {
          ForEach(row, id: \.self) { key in
            keyView(key)
          }
        }
      }
    }
  }

  @ViewBuilder private func keyView(_ key: Self.Key) -> some View {
    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
      Group {
        switch key {
        case .number(let number):
          Text("\(number)")
        case .comma:
          Text(",")
        case .submit:
          Text("✅")
        }
      }
      .foregroundStyle(Color.gray)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color(UIColor.secondarySystemBackground))
      .clipShape(RoundedRectangle(cornerRadius: 12))
    })

  }
}

extension NumberPadView {
  enum Key: Hashable {
    case number(Int)
    case comma
    case submit
  }
}

#Preview {
  NumberPadView()
}
