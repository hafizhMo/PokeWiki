//
//  PokemonDTO.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

struct PokemonDTO: Codable, Identifiable, Equatable {
  var id = UUID()
  let name: String
  let url: String
}
