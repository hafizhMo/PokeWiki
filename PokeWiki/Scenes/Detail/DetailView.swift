//
//  DetailView.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 28/08/23.
//

import SwiftUI

struct DetailView: View {
  let pokemon: PokemonDTO
  let dimensions: Double = 200
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
        image
          .resizable()
          .scaledToFit()
      } placeholder: {
        ProgressView()
          .frame(width: dimensions, height: dimensions)
      }

      Text(pokemon.name.capitalized)
        .bold()
        .font(.title2)
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(pokemon: PokemonDTO(name: "Bulbasaur", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"))
  }
}
