//
//  ImageButton.swift
//  aresi
//
//  Created by Ben Keil on 25.08.23.
//

import SwiftUI

struct ImageButton: ViewModifier {
  var fontSize: CGFloat = 30
  var withOffset: Bool = false
  var offset: CGFloat {
    return floor(size * 0.2 * -1)
  }

  var size: CGFloat {
    return floor(fontSize * 1.1)
  }

  func body(content: Content) -> some View {
    content
      .font(.system(size: fontSize))
      .frame(width: size, height: size)
      .background(Color.white)
      .clipShape(Circle())
      .offset(CGSize(width: offset, height: offset), condition: withOffset)
  }
}

extension View {
  func rountImageButton(fontSize: CGFloat = 30, withOffset: Bool = false) -> some View {
    modifier(ImageButton(fontSize: fontSize, withOffset: withOffset))
  }
}
