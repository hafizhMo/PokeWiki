//
//  PokemonDTO.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

struct PokemonDTO: Codable, Identifiable, Equatable {
  let id = UUID()
  let name: String
  let url: String
  
  var index: Int {
    let i = url
      .dropFirst(34)
      .dropLast()
    return Int(i) ?? 1
  }
  
  var imageUrl: String {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(index).png"
  }
}
