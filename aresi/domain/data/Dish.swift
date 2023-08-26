//
//  Dish.swift
//  aresi
//
//  Created by Ben Keil on 12.08.23.
//

import CoreTransferable
import Foundation
import SwiftUI

struct Dish: Hashable, Codable, Identifiable {
  var id: UUID = .init()
  var name: String
  var ingredients: [Ingredient]
  var preparation: String
  var image: String
}

enum TransferError: Error {
  case importFailed
}

struct DishImage: Transferable {
  let image: Image

  static var transferRepresentation: some TransferRepresentation {
    DataRepresentation(importedContentType: .image) { data in
      #if canImport(AppKit)
        guard let nsImage = NSImage(data: data) else {
          throw TransferError.importFailed
        }
        let image = Image(nsImage: nsImage)
        return DishImage(image: image)
      #elseif canImport(UIKit)
        guard let uiImage = UIImage(data: data) else {
          throw TransferError.importFailed
        }
        let image = Image(uiImage: uiImage)
        return DishImage(image: image)
      #else
        throw TransferError.importFailed
      #endif
    }
  }
}

struct Ingredient: Hashable, Codable, Identifiable {
  var id: UUID = .init()
  var name: String
  var amount: Int
  var unit: Unit

  static func empty() -> Ingredient {
    return Ingredient(name: "", amount: 0, unit: .gram)
  }
}

enum Unit: LocalizedStringKey, Hashable, Codable, CaseIterable {
  case gram
  case liter
  case milliliter
  case pieces
}
