//
//  Picker.swift
//  aresi
//
//  Created by Ben Keil on 26.08.23.
//

import SwiftUI

struct DummyPicker: ViewModifier {
  func body(content: Content) -> some View {
    content
      .hidden()
      .labelsHidden()
      .frame(width: 0)
  }
}

extension Picker {
  func dummy() -> some View {
    modifier(DummyPicker())
  }
}
