//
//  DishViewModel.swift
//  aresi
//
//  Created by Ben Keil on 13.08.23.
//

import CoreTransferable
import Foundation
import PhotosUI
import SwiftUI

@MainActor class DishViewModel: ObservableObject {
  enum ImagePickerState {
    case hidden
    case visible(sourceType: UIImagePickerController.SourceType)
  }

  enum ImageState {
    case empty
    case loading(Progress)
    case success(Image)
    case failure(Error)
  }

  enum Field: Hashable {
    case name
    case amount(id: UUID)
    case ingredient(id: UUID)
    case preparation
  }

  @Published var dish: Dish
  @Published private(set) var newIngredientAdded: Bool = false
  @Published var imageState: ImageState = .success(Image("kua-kling"))
  @Published var imageSelection: PhotosPickerItem? = nil {
    didSet {
      if let imageSelection {
        let progress = loadTransferable(from: imageSelection)
        imageState = .loading(progress)
      } else {
        imageState = .empty
      }
    }
  }

  @Published var focusField: Field?
  @Published var imagePickerSourceType: UIImagePickerController.SourceType = .photoLibrary

  @Published var showImagePicker: Bool = false

  init(dish: Dish) {
    self.dish = dish
  }

  func deleteIngredient(_ element: Ingredient) {
    switch focusField {
    case let .amount(id): fallthrough
    case let .ingredient(id):
      if id == element.id {
        focusField = nil
      }
    default: break
    }
    Task {
      dish.ingredients.removeAll { ingredient in
        ingredient.id == element.id
      }
    }
  }

  func addImage(image: UIImage) {
    imageState = .success(Image(uiImage: image))
    closeImagePicker()
  }

  func addNewIngredient() {
    let ingredient = Ingredient.empty()
    dish.ingredients.append(ingredient)
    newIngredientAdded = true
    focusField = .amount(id: ingredient.id)
  }

  func saveDish() {
    dish.ingredients.removeAll { ingredient in
      ingredient.name == "" || ingredient.amount == 0
    }
  }

  func deleteImage() {
    imageState = .empty
  }

  func openImagePicker(sourceType: UIImagePickerController.SourceType) {
    imagePickerSourceType = sourceType
    showImagePicker = true
  }

  func closeImagePicker() {
    showImagePicker = false
  }

  // MARK: - Private Methods

  private func loadTransferable(from imageSelection: PhotosPickerItem) -> Progress {
    return imageSelection.loadTransferable(type: DishImage.self) { result in
      DispatchQueue.main.async {
        guard imageSelection == self.imageSelection else {
          print("Failed to get the selected item.")
          return
        }
        switch result {
        case let .success(dishImage?):
          self.imageState = .success(dishImage.image)
        case .success(nil):
          self.imageState = .empty
        case let .failure(error):
          self.imageState = .failure(error)
        }
      }
    }
  }
}
