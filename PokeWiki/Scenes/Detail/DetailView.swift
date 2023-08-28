//
//  DetailView.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 28/08/23.
//

import SwiftUI

struct DetailView: View {
  
  @StateObject var viewModel: ViewModel
  
  init(viewModel: ViewModel = .init(), pokemon: PokemonDTO) {
    _viewModel = StateObject(wrappedValue: viewModel)
    self.pokemon = pokemon
    
    viewModel.getDetails(pokemon: pokemon)
  }
  
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
      
      VStack(spacing: 10) {
        Text("**ID**: \(viewModel.pokemonDetail?.id ?? 0)")
        Text("**Weight**: \(viewModel.pokemonDetail?.formatedWeight ?? "???") KG")
        Text("**Height**: \(viewModel.pokemonDetail?.formatedHeight ?? "???") M")
      }
      .padding()
    }
  }
}

extension DetailView {
  class ViewModel: ObservableObject {
    
    private let dataStore = PokemonDataStore()
    
    @Published var pokemonDetail: PokemonDetailDTO?
    
    func getDetails(pokemon: PokemonDTO) {
      pokemonDetail = PokemonDetailDTO(id: 0, height: 0, weight: 0)
      
      dataStore.getPokemonDetail(id: pokemon.index) { data in
        DispatchQueue.main.async {
          self.pokemonDetail = data
        }
      }
    }
    
    func formatHW(value: Int) -> String {
      let dValue = Double(value)
      let string = String(format: "%.2f", dValue / 10)
      
      return string
    }
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(pokemon: PokemonDTO(name: "Bulbasaur", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"))
  }
}
