//
//  ApplicationContext.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import Foundation

class ApplicationContext {
  static var shared = ApplicationContext()

  private(set) var dishRepository: DishRepository

  init() {
    dishRepository = MockDishRepository()
  }
}
