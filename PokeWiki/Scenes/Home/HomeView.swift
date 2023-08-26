//
//  ContentView.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = ViewModel()
  
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    NavigationView {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.filteredPokemon) { pokemon in
            HomeItemView(index: pokemon.index)
          }
        }
        .padding(8)
      }
      .navigationTitle("PokemonWiki")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: viewModel.getPokemons)
      .searchable(text: $viewModel.keyword)
    }
  }
}

extension HomeView {
  final class ViewModel: ObservableObject {
    
    private let dataStore = PokemonDataStore()
    
    @Published var pokemons = [PokemonDTO]()
    @Published var keyword = ""
    
    func getPokemons() {
      pokemons = dataStore.getPokemon()
    }
    
    var filteredPokemon: [PokemonDTO] {
      return keyword == "" ? pokemons : pokemons.filter { $0.name.contains(keyword.lowercased()) }
    }
  }
}
