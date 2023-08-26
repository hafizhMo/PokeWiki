//
//  PokemonDataStore.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

class PokemonDataStore {
  func getPokemon() -> [PokemonDTO] {
    let data: PokemonPageDTO = Bundle.main.decode(file: "pokemon.json")
    let pokemon = data.results
    
    return pokemon
  }

  func getPokemonDetail(id: Int, _ completion: @escaping((PokemonDetailDTO) -> Void)) {
    Bundle.main.fetch(url: "https://pokeapi.co/api/v2/pokemon/\(id)/", model: PokemonDetailDTO.self) { data in
      completion(data)
    } failure: { error in
      print(error)
    }
  }
}
