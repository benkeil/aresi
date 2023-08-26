//
//  DishView.swift
//  aresi
//
//  Created by Ben Keil on 13.08.23.
//

import AVKit
import PhotosUI
import SwiftUI

struct DishView: View {
  @Environment(\.editMode) private var editMode
  @Environment(\.defaultMinListRowHeight) var minRowHeight

  private var isEditing: Bool {
    editMode?.wrappedValue.isEditing == true
  }

  @StateObject var viewModel: DishViewModel = .init(dish: Dish.mock())

  var body: some View {
    ScrollView {
      dishView
        .navigationTitle(viewModel.dish.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          if isEditing {
            Button {
              print("cancel")
            } label: {
              Text("Cancel")
            }
          }
          EditButton()
        }
        .onChange(of: isEditing) { value in
          if value {
            // do something
          } else {
            viewModel.saveDish()
          }
        }
        .padding()
    }
  }

  @ViewBuilder
  var dishView: some View {
    EditableText(value: $viewModel.dish.name)
      .title()
    image
    ingredients
    preparation
    Spacer()
  }

  @ViewBuilder
  var image: some View {
    switch viewModel.imageState {
    case let .success(image):
      image
        .resizable()
        .scaledToFill()
        .frame(maxHeight: 250)
        .clipped()
        .overlay(alignment: .bottomTrailing) {
          if isEditing {
            HStack {
              deletePhoto
              editPhoto
            }
          }
        }
    case .loading:
      ProgressView()
        .frame(maxHeight: 250)
    case .empty:
      if isEditing {
        editPhoto
      }
    case .failure:
      Image(systemName: "exclamationmark.triangle.fill")
        .resizable()
        .scaledToFill()
        .frame(maxHeight: 250)
    }
  }

  var deletePhoto: some View {
    Button {
      viewModel.deleteImage()
    } label: {
      Image(systemName: "trash.circle")
        .rountImageButton()
    }
  }

  var editPhoto: some View {
    PhotosPicker(selection: $viewModel.imageSelection,
                 matching: .images,
                 photoLibrary: .shared())
    {
      Image(systemName: "photo.circle")
        .rountImageButton()
    }
  }

  @ViewBuilder
  var ingredients: some View {
    Text("Ingredients")
      .title()
    Divider()
    Grid {
      ForEach($viewModel.dish.ingredients) { $ingredient in
        GridRow {
          if isEditing == true {
            Button(role: .destructive) {
              viewModel.deleteIngredient($ingredient.wrappedValue)
            } label: {
              Image(systemName: "minus.circle.fill")
            }
          }
          IngredientComponent(ingredient: $ingredient)
        }
        Divider()
      }
    }
    if isEditing == true {
      Button {
        viewModel.addIngredient()
      } label: {
        Label("add new ingredient", systemImage: "plus.circle.fill")
      }
    }
  }

  @ViewBuilder
  var preparation: some View {
    Text("Zubereitung")
      .title()
    EditableText(value: $viewModel.dish.preparation, useEditor: true)
      .multilineTextAlignment(.leading)
  }
}

struct DishView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      DishView()
        .environment(\.editMode, .constant(.active))
    }
  }
}
