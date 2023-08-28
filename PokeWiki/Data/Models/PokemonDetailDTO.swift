//
//  PokemonDetailDTO.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

struct PokemonDetailDTO: Codable {
  let id: Int
  let height: Int
  let weight: Int
  
  var formatedHeight: String {
      let dValue = Double(height)
      let string = String(format: "%.2f", dValue / 10)
      
      return string
  }
  
  var formatedWeight: String {
    let dValue = Double(weight)
    let string = String(format: "%.2f", dValue / 10)
    
    return string
  }
}
