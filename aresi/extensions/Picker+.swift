//
//  Picker+.swift
//  aresi
//
//  Created by Ben Keil on 26.08.23.
//

import SwiftUI

extension Picker {
  static func dummy() -> Picker {
    return Picker("dummy", selection: .constant(1)) {}
      .dummy()
  }
}
