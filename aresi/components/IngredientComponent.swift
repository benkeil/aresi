//
//  IngredientComponent.swift
//  aresi
//
//  Created by Ben Keil on 17.08.23.
//

import SwiftUI

struct IngredientComponent: View {
  @Environment(\.editMode) private var editMode

  @Binding var ingredient: Ingredient

  @ViewBuilder
  var body: some View {
    HStack {
      if editMode?.wrappedValue.isEditing == true {
        editModeView
      } else {
        readModeView
      }
    }
  }

  @ViewBuilder
  private var editModeView: some View {
    TextField("amount", value: $ingredient.amount, format: .number)
      .keyboardType(.numberPad)
      .textFieldStyle(.roundedBorder)
      .frame(maxWidth: 75, alignment: .trailing)
    Picker("", selection: $ingredient.unit) {
      ForEach(Unit.allCases, id: \.self) {
        Text($0.rawValue)
      }
    }
    .frame(maxWidth: 60, alignment: .trailing)
    TextField("name", text: $ingredient.name)
      .textFieldStyle(.roundedBorder)
      .frame(maxWidth: .infinity, alignment: .leading)
  }

  @ViewBuilder
  private var readModeView: some View {
    Text("\(ingredient.amount)")
      .frame(maxWidth: 75, alignment: .trailing)
    Text(ingredient.unit.rawValue)
      .frame(maxWidth: 30, alignment: .leading)
    Text(ingredient.name)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct IngredientComponent_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      EditButton()
      Grid {
        GridRow {
          IngredientComponent(ingredient: .constant(Ingredient(name: "Reis", amount: 125, unit: .gram)))
        }
        GridRow {
          IngredientComponent(ingredient: .constant(Ingredient(name: "Reis", amount: 125, unit: .liter)))
        }
        GridRow {
          IngredientComponent(ingredient: .constant(Ingredient(name: "Reis", amount: 125, unit: .pieces)))
        }
      }
    }
    .environment(\.locale, Locale(identifier: "de"))
    .environment(\.editMode, .constant(.active))
  }
}
