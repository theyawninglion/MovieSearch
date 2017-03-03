//
//  MovieController.swift
//  MovieSearch
//
//  Created by Taylor Phillips on 2/24/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class MovieController {
    
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    static let apiKey = "66b0f042f063fbc3d55b879b592b32a0"
    
    static func searchMovie(movieName movie: String, completion: @escaping ([Movie]) -> Void) {
        
        guard let url = baseURL else { completion([]); return }
        let urlParameters = ["api_key": apiKey, "query" : movie]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            if let error = error{
                print("ERROR: NetworkController.MovieController\(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data,
                let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
                let moviesArray = jsonDictionary["results"] as? [[String:Any]]
                else { completion([]); return }
            
            let movies = moviesArray.flatMap({ Movie(dictionary: $0) })
            
            for movie in movies {
                ImageController.image(forURL: movie.posterURL, completion: { (posterImage) in
                    movie.posterImage = posterImage
                })
            }
           
            completion(movies)
            
        }
    }
}
