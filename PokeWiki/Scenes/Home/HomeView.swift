//
//  ContentView.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import SwiftUI

struct HomeView: View {
  
  @StateObject var viewModel = ViewModel()
  @State private var showDetail = false
  @State private var selectedPokemon: PokemonDTO? = nil
  
  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    NavigationStack(root: {
      ScrollView {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.filteredPokemon) { pokemon in
            Button {
              selectedPokemon = pokemon
            } label: {
              HomeItemView(imageUrl: pokemon.imageUrl)
            }
          }
          .sheet(item: $selectedPokemon) { pokemon in
            DetailView(pokemon: pokemon)
          }
        }
        .padding(8)
      }
      .navigationTitle("PokemonWiki")
      .navigationBarTitleDisplayMode(.inline)
      .onAppear(perform: viewModel.getPokemons)
      .searchable(text: $viewModel.keyword)
    })
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
