//
//  DishView.swift
//  aresi
//
//  Created by Ben Keil on 13.08.23.
//

import AVKit
import PhotosUI
import SwiftUI

struct DishEditView: View {
  @Environment(\.editMode) private var editMode
  @Environment(\.defaultMinListRowHeight) var minRowHeight

  private var isEditing: Bool {
    editMode?.wrappedValue.isEditing == true
  }

  @State private var height: CGFloat = .zero
  @FocusState var isFocused: Bool

  @StateObject var viewModel: DishViewModel = .init(dish: Dish.mock())

  var body: some View {
    Form {
      Section("Name") {
        TextField("dish", text: $viewModel.dish.name)
      }
      Section("Photo") {
        image
          .listRowInsets(.init())
      }
      Section("Ingredients") {
        ingredients
      }
      Section("Preparation") {
        preparation
      }
    }
    .font(.body)
    .navigationTitle(viewModel.dish.name)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      EditButton()
    }
    .onChange(of: isEditing) { value in
      if !value {
        viewModel.saveDish()
      }
    }
    .scrollDismissesKeyboard(.interactively)
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
                .rountImageButton(withOffset: true)
              editPhoto
                .rountImageButton(withOffset: true)
            }
          }
        }
    case .loading:
      ProgressView()
        .frame(maxHeight: 250)
    case .empty:
      if isEditing {
        HStack {
          Spacer()
          editPhoto
            .rountImageButton()
          Spacer()
        }
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
    }
    .buttonStyle(.borderless)
  }

  var editPhoto: some View {
    PhotosPicker(selection: $viewModel.imageSelection,
                 matching: .images,
                 photoLibrary: .shared())
    {
      Image(systemName: "photo.circle")
    }
  }

  @ViewBuilder
  var ingredients: some View {
    ForEach($viewModel.dish.ingredients) { $ingredient in
      HStack {
        Picker("dummy", selection: .constant(1)) { Text("").tag(1) }
          .dummy()

        Button(role: .destructive) {
          viewModel.deleteIngredient($ingredient.wrappedValue)
        } label: {
          Image(systemName: "minus.circle.fill")
        }
        .buttonStyle(.borderless)

        TextField("amount", value: $ingredient.amount, format: .number)
          .keyboardType(.numberPad)
          .frame(maxWidth: 35, alignment: .trailing)

        Picker("", selection: $ingredient.unit) {
          ForEach(Unit.allCases, id: \.self) {
            Text($0.rawValue)
          }
        }
        .labelsHidden()
        .frame(maxWidth: 50, alignment: .trailing)

        TextField("name", text: $ingredient.name)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
    }

    HStack {
      Spacer()
      Button {
        viewModel.addIngredient()
      } label: {
        Label("add new ingredient", systemImage: "plus.circle.fill")
      }
      .buttonStyle(.borderless)
      Spacer()
    }
  }

  @ViewBuilder
  var preparation: some View {
    ZStack {
      Text(viewModel.dish.preparation)
        .foregroundColor(.clear)
        .padding(6)
        .background(GeometryReader {
          Color.clear.preference(key: ViewHeightKey.self, value: $0.frame(in: .local).size.height)
        })
      TextEditor(text: $viewModel.dish.preparation)
        .multilineTextAlignment(.leading)
        .frame(minHeight: height)
        .focused($isFocused)
        .toolbar {
          ToolbarItemGroup(placement: .keyboard) {
            Button("Done") {
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
          }
        }
    }
    .onPreferenceChange(ViewHeightKey.self) { height = $0 }
  }
}

struct ViewHeightKey: PreferenceKey {
  typealias Value = CGFloat
  static var defaultValue = CGFloat.zero
  static func reduce(value: inout Value, nextValue: () -> Value) {
    value += nextValue()
  }
}

struct DishEditView_Previews: PreviewProvider {
  static var previews: some View {
//    NavigationStack {
    DishEditView()
      .environment(\.editMode, .constant(.active))
//    }
  }
}
