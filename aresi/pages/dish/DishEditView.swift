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
  @StateObject var viewModel: DishViewModel = .init(dish: Dish.mock())
  @FocusState var focusField: DishViewModel.Field?

  var body: some View {
    Form {
      Section("Name") { TextField("dish", text: $viewModel.dish.name) }
      Section("Photo") { image.listRowInsets(.init()) }
      Section("Ingredients") { ingredients }
      Section("Preparation") { preparation }
    }
    .font(.body)
    .navigationBarTitleDisplayMode(.inline)
    .onChange(of: viewModel.focusField) { focusField = $0 }
    .scrollDismissesKeyboard(.interactively)
    .fullScreenCover(isPresented: $viewModel.showImagePicker) {
      ImagePicker(sourceType: viewModel.imagePickerSourceType) { image in
        viewModel.addImage(image: image)
      }
    }
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
          HStack {
            deletePhoto
              .rountImageButton(withOffset: true)
            editPhoto
              .rountImageButton(withOffset: true)
          }
        }
    case .loading:
      ProgressView()
        .frame(maxHeight: 250)
    case .empty:
      HStack {
        Spacer()
        editPhoto
          .rountImageButton()
        Spacer()
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
    Menu {
      Button {
        viewModel.openImagePicker(sourceType: .camera)
      } label: {
        Label("Camera", systemImage: "camera")
      }
      Button {
        viewModel.openImagePicker(sourceType: .photoLibrary)
      } label: {
        Label("Photo album", systemImage: "photo.on.rectangle")
      }
    } label: {
      Image(systemName: "photo.circle")
    }

//    PhotosPicker(selection: $viewModel.imageSelection,
//                 matching: .images,
//                 photoLibrary: .shared())
//    {
//      Image(systemName: "photo.circle")
//    }
  }

  @ViewBuilder
  var ingredients: some View {
    ForEach($viewModel.dish.ingredients) { $ingredient in
      HStack(spacing: 10) {
        Button(role: .destructive) {
          viewModel.deleteIngredient($ingredient.wrappedValue)
        } label: {
          Image(systemName: "minus.circle.fill")
        }
        .buttonStyle(.borderless)

        TextField("amount", value: $ingredient.amount, format: .number)
          .keyboardType(.numberPad)
          .frame(width: 35, alignment: .trailing)
          .focused($focusField, equals: .amount(id: $ingredient.wrappedValue.id))

        Picker("unit", selection: $ingredient.unit) {
          ForEach(Unit.allCases) { unit in
            Text(LocalizedStringKey(unit.rawValue))
          }
        }
        .labelsHidden()
        .frame(width: 50, alignment: .trailing)

        TextField("name", text: $ingredient.name)
          .focused($focusField, equals: .ingredient(id: $ingredient.wrappedValue.id))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .padding(-1)
    }
    .listRowInsets(.none)

    HStack {
      Spacer()
      Button { viewModel.addNewIngredient() } label: {
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
        .padding(.horizontal, 5)
        .padding(.top, 10)
        .foregroundColor(Color.clear)
      TextEditor(text: $viewModel.dish.preparation)
        .multilineTextAlignment(.leading)
    }
  }
}

struct DishEditView_Previews: PreviewProvider {
  static var previews: some View {
    DishEditView()
      .environment(\.editMode, .constant(.active))
  }
}
