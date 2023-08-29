//
//  Content+.swift
//  aresi
//
//  Created by Ben Keil on 26.08.23.
//

import SwiftUI

public extension View {
  @ViewBuilder
  @inlinable func offset(_ offset: CGSize, condition: Bool) -> some View {
    if condition {
      self.offset(offset)
    } else {
      self
    }
  }
}

extension View {
  func hideKeyboard() {
    let resign = #selector(UIResponder.resignFirstResponder)
    UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
  }
}
