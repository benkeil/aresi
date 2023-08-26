//
//  DishView.swift
//  aresi
//
//  Created by Ben Keil on 12.08.23.
//

import SwiftUI

// https://peterfriese.dev/posts/swiftui-listview-part2/

struct DishesView: View {
  @StateObject var viewModel = DishesViewModel()

  var body: some View {
    NavigationStack {
      List {
        ForEach(viewModel.dishes) { dish in
          NavigationLink(dish.name, value: dish)
        }
      }
      .navigationTitle("Dishes")
      .navigationBarTitleDisplayMode(.large)
      .navigationDestination(for: Dish.self) { dish in
        DishView(viewModel: DishViewModel(dish: dish))
      }
      .animation(.default, value: viewModel.dishes)
      .task {
        await self.viewModel.load()
      }
    }
  }
}

struct DishesView_Previews: PreviewProvider {
  static var previews: some View {
    DishesView()
  }
}
