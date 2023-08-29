//
//  DishView.swift
//  aresi
//
//  Created by Ben Keil on 12.08.23.
//

import SwiftUI

// https://peterfriese.dev/posts/swiftui-listview-part2/

struct Token: Identifiable {
  var id: String { value }
  let value: String
}

struct DishesView: View {
  @StateObject var viewModel = DishesViewModel()
  @State var selection: Category = .food
  @State var tokens: [Category] = []

  var body: some View {
    NavigationStack {
//      Picker("Foobar", selection: $selection) {
//        ForEach(Category.allCases) { category in
//          Button {} label: { Text(category.rawValue) }
//        }
//      }
//      .padding()
//      .pickerStyle(.segmented)
      List {
        ForEach(viewModel.sorted, id: \.key) { key, values in
          Section(header: Text(key.rawValue)) {
            ForEach(values) { value in
              NavigationLink(value.name, value: value)
            }
          }
        }
      }
      .animation(.default, value: viewModel.dishes)
      .searchable(text: $viewModel.searchText, tokens: $tokens, token: { token in
        Text(token.rawValue)
      })
      .searchSuggestions {
        ForEach(Category.allCases) { category in
          Text(category.rawValue).searchCompletion(category)
        }
      }
      .navigationTitle("Dishes")
      .navigationBarTitleDisplayMode(.large)
      .navigationDestination(for: Dish.self) { dish in
        DishView(viewModel: DishViewModel(dish: dish))
      }
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
