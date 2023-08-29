//
//  PlaygroundView.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import SwiftUI

enum Thickness: String, CaseIterable, Identifiable {
  case thin
  case regular
  case thick

  var id: String { rawValue }
}

struct Border {
  var color: Color
  var thickness: Thickness
}

struct PlaygroundView: View {
  @State private var searchText = ""

  @State private var selectedObjectBorders = [
    Border(color: .black, thickness: .thin),
    Border(color: .red, thickness: .thick),
  ]

  var body: some View {
    Picker(
      "Border Thickness",
      sources: $selectedObjectBorders,
      selection: \.thickness
    ) {
      ForEach(Thickness.allCases) { thickness in
        Text(thickness.rawValue)
      }
    }
    .pickerStyle(.segmented)
  }
}

struct PlaygroundView_Previews: PreviewProvider {
  static var previews: some View {
    PlaygroundView()
  }
}
