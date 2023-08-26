//
//  PlaygroundView.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import SwiftUI

struct PlaygroundView: View {
  @State private var names = ["a", "b", "c", "d"]
  @State private var selection: String?

  var body: some View {
    NavigationStack {
      Form {
        HStack {
            Picker("picker", selection: $selection) {
              ForEach(names, id: \.self) {
                Text($0)
              }
            }
            TextField("foo", text: .constant("foo"))
            TextField("baz", text: .constant("baz"))
        }
        HStack {
          TextField("foo", text: .constant("foo"))
          Picker("picker", selection: $selection) {
            ForEach(names, id: \.self) {
              Text($0)
            }
          }
          TextField("baz", text: .constant("baz"))
        }
//        HStack {
          Group {
            TextField("foo", text: .constant("foo"))
            TextField("baz", text: .constant("baz"))
            Picker("picker", selection: $selection) {
              ForEach(names, id: \.self) {
                Text($0)
              }
            }
//          }
        }
        Text("....")
      }
    }
  }
}

struct PlaygroundView_Previews: PreviewProvider {
  static var previews: some View {
    PlaygroundView()
  }
}
