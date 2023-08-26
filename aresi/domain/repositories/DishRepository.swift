//
//  DishRepository.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import Foundation

protocol DishRepository {
  func getAll() async throws -> [Dish]
}
