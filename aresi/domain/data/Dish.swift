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
  var category: Category
  var ingredients: [Ingredient]
  var preparation: String
  var image: String
}

extension Dish {
  static func empty(category: Category = .food) -> Dish {
    return Dish(name: "", category: category, ingredients: [], preparation: "", image: "")
  }
}

enum Category: String, Hashable, Codable, CaseIterable, Identifiable, Comparable {
  var id: Self { self }
  case pastry
  case beverage
  case food

  static func < (lhs: Category, rhs: Category) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  static func > (lhs: Category, rhs: Category) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }

  static func == (lhs: Category, rhs: Category) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }
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

// enum Unit: LocalizedStringKey, Hashable, Codable, CaseIterable, Identifiable {
enum Unit: String, Hashable, Codable, CaseIterable, Identifiable {
  var id: Self { self }
  case gram
  case liter
  case milliliter
  case pieces
}
