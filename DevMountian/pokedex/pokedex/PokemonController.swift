//
//  PokemonController.swift
//  pokedex
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

class PokemonController{
    // MARK:  - functions
    static let baseURL = URL(string: "http://pokeapi.co/api/v2/pokemon/")
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let unwrappedUrl = baseURL else { completion(nil) ; return }
        let url = unwrappedUrl.appendingPathComponent(searchTerm.lowercased())
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: nil, body: nil) { (data, error) in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = data else {completion(nil); return}
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else {completion(nil); return}
            
            guard let pokemon = Pokemon(dictionary: jsonDictionary)
                else {completion(nil); return}
            
            ImageController.image(forURL: pokemon.imageEndpooint, completion: { (image) in
                pokemon.image = image
                DispatchQueue.main.async {
                    completion(pokemon)
                }
            })
            
        }
        
    }
}
