//
//  Title.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import SwiftUI

struct Title: ViewModifier {
  func body(content: Content) -> some View {
    content
      .textCase(.uppercase)
      .font(.title)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.vertical)
  }
}

extension View {
  func title() -> some View {
    modifier(Title())
  }
}
