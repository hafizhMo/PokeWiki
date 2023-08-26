//
//  NetworkHelper.swift
//  PokeWiki
//
//  Created by Hafizh Mo on 26/08/23.
//

import Foundation

extension Bundle {
  func fetch<T: Decodable>(url: String, model: T.Type, completion: @escaping((T) -> Void), failure: @escaping((Error) -> Void)) {
    guard let url = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data else {
        if let error = error { failure(error) }
        return
      }
      
      do {
        let response = try JSONDecoder().decode(T.self, from: data)
        completion(response)
      } catch {
        failure(error)
      }
    }.resume()
  }
}
