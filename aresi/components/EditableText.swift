//
//  EditableText.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import SwiftUI

struct EditableText: View {
  @Environment(\.editMode) private var editMode
  @Binding var value: String
  var useEditor: Bool = false
  var body: some View {
    if editMode?.wrappedValue.isEditing == true {
      if useEditor {
        TextEditor(text: $value)
          .background(Color.primary.colorInvert())
          .padding(4)
          .overlay(
            RoundedRectangle(cornerRadius: 8)
              .stroke(Color.secondary, lineWidth: 0.2).opacity(0.5)
          )
      } else {
        TextField("Name", text: $value)
          .textFieldStyle(.roundedBorder)
      }
    } else {
      Text(value)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

struct EditableText_Previews: PreviewProvider {
  static var previews: some View {
    EditableText(value: .constant("Foo Bar\nFoo Bar\nFoo Bar\nFoo Bar\nFoo Bar"), useEditor: true)
      .environment(\.editMode, .constant(.active))
      .previewDisplayName("inactive")
    EditableText(value: .constant(""))
      .environment(\.editMode, .constant(.active))
      .previewDisplayName("active")
  }
}
