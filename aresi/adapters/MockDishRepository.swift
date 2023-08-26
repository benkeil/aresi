//
//  MockDishRepository.swift
//  aresi
//
//  Created by Ben Keil on 16.08.23.
//

import Foundation

class MockDishRepository: DishRepository {
  func getAll() async throws -> [Dish] {
    return [
      Dish(
        id: UUID(),
        name: "Schnitzel",
        ingredients: [
          Ingredient(name: "Reis", amount: 125, unit: .gram),
          Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
          Ingredient(name: "Chilies", amount: 3, unit: .pieces),
        ],
        preparation: """
        Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

        1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

        In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

        Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

        Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

        Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
        """,
        image: "kua-kling"
      ),
      Dish(
        id: UUID(),
        name: "Kuakling Moo",
        ingredients: [
          Ingredient(name: "Reis", amount: 125, unit: .gram),
          Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
          Ingredient(name: "Chilies", amount: 3, unit: .pieces),
        ],
        preparation: """
        Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

        1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

        In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

        Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

        Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

        Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
        """,
        image: "kua-kling"
      ),
      Dish(
        id: UUID(),
        name: "Makkaroni",
        ingredients: [
          Ingredient(name: "Reis", amount: 125, unit: .gram),
          Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
          Ingredient(name: "Chilies", amount: 3, unit: .pieces),
        ],
        preparation: """
        Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

        1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

        In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

        Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

        Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

        Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
        """,
        image: "kua-kling"
      ),
      Dish(
        id: UUID(),
        name: "Massamann Curry",
        ingredients: [
          Ingredient(name: "Reis", amount: 125, unit: .gram),
          Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
          Ingredient(name: "Chilies", amount: 3, unit: .pieces),
        ],
        preparation: """
        Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

        1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

        In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

        Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

        Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

        Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
        """,
        image: "kua-kling"
      ),
      Dish(
        id: UUID(),
        name: "Chili con Carne",
        ingredients: [
          Ingredient(name: "Reis", amount: 125, unit: .gram),
          Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
          Ingredient(name: "Chilies", amount: 3, unit: .pieces),
        ],
        preparation: """
        Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

        1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

        In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

        Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

        Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

        Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
        """,
        image: "kua-kling"
      ),
    ]
  }
}

extension Dish {
  static func mock() -> Dish {
    return Dish(
      id: UUID(),
      name: "Kuakling Moo",
      ingredients: [
        Ingredient(name: "Reis", amount: 125, unit: .gram),
        Ingredient(name: "Kuakling Chilli Paste", amount: 150, unit: .gram),
        Ingredient(name: "Chilies", amount: 3, unit: .pieces),
      ],
      preparation: """
      Pellkartoffeln schälen und in 2 cm große Würfel, die geputzten Bohnen in 4 cm lange Stücke schneiden.

      1 EL Butterschmalz in einer kleineren Pfanne auf mittlerer Hitze erwärmen, die Zwiebeln darin erst glasig dünsten, dann unter ständigem Rühren goldbraun braten. Den Knoblauch hinzufügen und mitbraten, aber nicht bräunen. Zum Schluss das gehackte Bohnenkraut untermischen und mit Salz und Pfeffer würzen. Alles aus der Pfanne auf einen Teller geben.

      In der Zwischenzeit die Bohnen in kräftigem Salzwasser 5 - 6 Minuten blanchieren. Abgießen und kurz abschrecken.

      Das restliche Butterschmalz in einer großen Pfanne oder zwei kleinen erhitzen, die Kartoffelwürfel darin von allen Seiten braun braten. Die Bohnen hinzufügen und erhitzen. Mit Salz und Pfeffer würzen.

      Die Zwiebel-Bohnenkrautmischung unterrühren und den geriebenen Käse darüber streuen. Einen Deckel auf die Pfanne legen und die Hitze auf ganz klein stellen (ich habe Induktion, da funktioniert das sofort. Beim Elektroherd schon vorher zurückschalten).

      Wenn der Käse ganz geschmolzen ist und sich am Rand kleine braune Krüstchen gebildet haben, auf Tellern anrichten.
      """,
      image: "kua-kling"
    )
  }
}
