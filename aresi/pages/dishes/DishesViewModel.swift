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
  @Published var sorted: [Dictionary<Category, [Dish]>.Element] = []
  
  @Published var searchText: String = ""

  // MARK: inputs

  @Published var newDish: String = ""

  // MARK: methods

  func load() async {
    do {
      try await Task.sleep(for: .seconds(1))
      dishes = try! await dishRepository.getAll()
      let groups = Dictionary(grouping: dishes, by: \.category)
      sorted = groups.sorted(by: { $0.key < $1.key })
      state = .success
    } catch {
      state = .loading
    }
  }

  func addDish() {
    dishes.append(Dish.empty(category: .food))
    newDish = ""
  }
}
