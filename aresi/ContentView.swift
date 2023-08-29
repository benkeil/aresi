//
//  ContentView.swift
//  aresi
//
//  Created by Ben Keil on 12.08.23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      DishesView()
        .tabItem {
          Image(systemName: "circle")
          Text("Dishes")
        }
        .tag(0)
      DishView()
        .tabItem {
          Image(systemName: "scribble")
          Text("Dish")
        }
        .tag(1)
      DishEditView()
        .environment(\.editMode, .constant(.active))
        .font(.title)
        .tabItem {
          Image(systemName: "pencil")
          Text("Edit")
        }
        .tag(2)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
