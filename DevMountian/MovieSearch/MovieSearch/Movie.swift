//
//  Movie.swift
//  MovieSearch
//
//  Created by Taylor Phillips on 2/24/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit
class Movie {
    
    private let movieNameKey = "original_title"
    private let ratingKey = "vote_average"
    private let releaseDateKey = "release_date"
    private let overviewKey = "overview"
    private let posterURLKey = "poster_path"
    
    let movieName: String
    let rating: Double
    let releaseDate: String
    let overview: String
    let posterURL: String
    
    var imageURL: URL? {
        return URL(string: posterURL)
    }
    var posterImage: UIImage?
    
    init?(dictionary: [String:Any]) {
        guard let movieName = dictionary[movieNameKey] as? String,
            let rating = dictionary[ratingKey] as? Double,
            let releaseDate = dictionary[releaseDateKey] as? String,
            let overview = dictionary[overviewKey] as? String,
            let posterURL = dictionary[posterURLKey] as? String
            else { return nil }
        
        self.movieName = movieName
        self.rating = rating
        self.releaseDate = releaseDate
        self.overview = overview
        self.posterURL = posterURL
        
    }
}
