//
//  DishView.swift
//  aresi
//
//  Created by Ben Keil on 13.08.23.
//

import AVKit
import NavigationTransitions
import PhotosUI
import SwiftUI

struct DishView: View {
  @Environment(\.defaultMinListRowHeight) var minRowHeight

  @StateObject var viewModel: DishViewModel = .init(dish: Dish.mock())

  @State private var editMode: Bool = false

  var body: some View {
    if editMode {
      DishEditView(viewModel: DishViewModel(dish: viewModel.dish))
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            Button {
              editMode.toggle()
            } label: {
              Text("Save")
            }
          }
        }
    } else {
      ScrollView {
        dishView
          .navigationTitle(viewModel.dish.name)
          .navigationBarTitleDisplayMode(.automatic)
          .toolbar {
            ToolbarItem(placement: .primaryAction) {
              Button {
                editMode.toggle()
              } label: {
                Text("Edit")
              }
            }
          }
          .padding()
      }
    }
  }

  @ViewBuilder
  var dishView: some View {
    image
      .cornerRadius(10)
    ingredients
    preparation
    Spacer()
  }

  @ViewBuilder
  var image: some View {
    switch viewModel.imageState {
    case let .success(image):
      image
        .resizable()
        .scaledToFill()
        .frame(maxHeight: 250)
        .clipped()
    case .loading:
      ProgressView()
        .frame(maxHeight: 250)
    case .empty:
      Color.clear
    case .failure:
      Image(systemName: "exclamationmark.triangle.fill")
        .resizable()
        .scaledToFill()
        .frame(maxHeight: 250)
    }
  }

  @ViewBuilder
  var ingredients: some View {
    Text("Ingredients")
      .title()
    Divider()
    Grid(alignment: .leadingFirstTextBaseline, horizontalSpacing: 15) {
      ForEach($viewModel.dish.ingredients) { $ingredient in
        GridRow {
          Text("\(ingredient.amount) \(ingredient.unit.rawValue)")
            .gridColumnAlignment(.trailing)
          Text(ingredient.name)
            .frame(maxWidth: .infinity, alignment: .leading)
            .gridColumnAlignment(.leading)
        }
        .padding(.horizontal)
        Divider()
      }
    }
  }

  @ViewBuilder
  var preparation: some View {
    Text("Zubereitung")
      .title()
    Text(viewModel.dish.preparation)
  }
}

struct DishView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      DishView()
        .environment(\.editMode, .constant(.active))
    }
  }
}
