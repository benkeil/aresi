//
//  ViewHeightKey.swift
//  aresi
//
//  Created by Ben Keil on 26.08.23.
//

import SwiftUI

struct ViewHeightKey: PreferenceKey {
  typealias Value = CGFloat
  static var defaultValue = CGFloat.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value += nextValue()
  }
}
