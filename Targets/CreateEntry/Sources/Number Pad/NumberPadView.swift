//
//  KeyboardView.swift
//  CreateEntry
//
//  Created by Quentin Eude on 01/12/2023.
//  Copyright © 2023 qeude. All rights reserved.
//

import Macro
import Settings
import SwiftUI

struct NumberPadView: View {
  var numberDisabled: Bool
  var onTap: (Self.Key) -> Void

  let keys: [[Self.Key]] = [
    [.number(1), .number(2), .number(3)],
    [.number(4), .number(5), .number(6)],
    [.number(7), .number(8), .number(9)],
    [.delete, .number(0), .submit]
  ]

  init(numberDisabled: Bool, onTap: @escaping (Self.Key) -> Void) {
    self.numberDisabled = numberDisabled
    self.onTap = onTap
  }

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
    Button(action: { onTap(key) } , label: {
      Group {
        switch key {
        case .number(let number):
          Text("\(number)")
        case .delete:
          Image(systemName: "delete.backward.fill")
        case .submit:
          Text("✅")
        }
      }
      .foregroundStyle(Color.gray)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color(UIColor.secondarySystemBackground))
      .clipShape(RoundedRectangle(cornerRadius: 12))
    })
    .disabled(numberDisabled && key.caseID == .number)
  }
}

extension NumberPadView {
  @IdentifiedEnumCases
  enum Key: Hashable {
    case number(Int)
    case delete
    case submit
  }
}

#Preview {
  NumberPadView(numberDisabled: false, onTap: {_ in })
}
