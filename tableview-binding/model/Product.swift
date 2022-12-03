//
//  Product.swift
//  tableview-binding
//
//  Created by Kelvin Fok on 3/12/22.
//

import Foundation

struct Product: Hashable {
  let name: String
  let imageName: String
  let price: Int
  let id: Int
  
  static let collection: [Product] = [
    .init(name: "Stroller", imageName: "stroller", price: 1, id: 1),
    .init(name: "Playstation", imageName: "playstation.logo", price: 2, id: 2),
    .init(name: "Ceiling fan", imageName: "fan.ceiling", price: 3, id: 3),
    .init(name: "Monitor", imageName: "display", price: 4, id: 4),
    .init(name: "Shirt", imageName: "tshirt", price: 5, id: 5)
  ]
}
