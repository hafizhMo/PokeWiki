//
//  HomeItemView.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import SwiftUI

struct HomeItemView: View {
  let dimensions: Double = 183
  var imageUrl: String
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: imageUrl)) { image in
        image
          .resizable()
          .scaledToFit()
          .padding()
          .frame(width: dimensions, height: dimensions)
      } placeholder: {
        ProgressView()
          .frame(width: dimensions, height: dimensions)
      }
      .background(.thinMaterial)
    }
  }
}

struct HomeItemView_Previews: PreviewProvider {
  static var previews: some View {
    HomeItemView(imageUrl: "")
  }
}
