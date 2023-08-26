//
//  DishesViewModel.swift
//  aresi
//
//  Created by Ben Keil on 12.08.23.
//

import Foundation

enum DishesViewState {
  case loading
  case success
}

@MainActor class DishesViewModel: ObservableObject {
  // MARK: context

  let dishRepository: DishRepository = ApplicationContext.shared.dishRepository

  // MARK: outputs

  @Published private(set) var state: DishesViewState = .loading
  @Published private(set) var dishes: [Dish] = []

  // MARK: inputs

  @Published var newDish: String = ""

  // MARK: methods

  func load() async {
    do {
      try await Task.sleep(for: .seconds(1))
      dishes = try! await dishRepository.getAll()
      state = .success
    } catch {
      state = .loading
    }
  }

  func addDish() {
    dishes.append(Dish(name: newDish, ingredients: [], preparation: "", image: ""))
    newDish = ""
  }
}
