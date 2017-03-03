//
//  MovieController.swift
//  Movies
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class MovieController{
    static let baseURL = URL(string: "https://api.themoviedb.org/3/search/movie?")
    static let apiKey = "66b0f042f063fbc3d55b879b592b32a0"
    
    static func seachMovies(movieName movie: String, completion: @escaping ([Movie])->Void){
        
        guard let url = baseURL else {completion([]); return}
        let URLParameters = ["api_key": apiKey, "query": movie]
        
        NetworkController.performRequest(for: url, httpMethod: .Get, urlParameters: URLParameters, body: nil) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            guard let data = data,
            let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any],
            let moviesArray = jsonDictionary["results"] as? [[String:Any]]
                else {completion([]);return}
            let movies = moviesArray.flatMap({Movie(dictionary: $0)})
            
            for movie in movies{
            ImageController.image(forURL: movie.posterURL, completion: { (image) in
                movie.image = image
            })
            }
            
                completion(movies)
                
            
        }
    }
}
