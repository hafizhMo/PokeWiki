//
//  PokemonPageDTO.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

struct PokemonPageDTO: Codable {
  let count: Int
  let next: String
  let results: [PokemonDTO]
}
