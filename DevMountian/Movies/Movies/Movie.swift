//
//  Movie.swift
//  Movies
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit
class Movie{
    
    private let movieNameKey = "original_title"
    private let ratingKey = "vote_average"
    private let summaryKey = "overview"
    private let posterKey = "poster_path"
    
    let movieName: String
    let rating: Double
    let summary: String
    let posterURL: String
    
    var imageURL: URL? {
        return URL(string: posterURL)
    }
    
    var image: UIImage?
    
    init?(dictionary: [String:Any]){
        guard let movieName = dictionary[movieNameKey] as? String,
        let rating = dictionary[ratingKey] as? Double,
        let summary = dictionary[summaryKey] as? String,
        let posterURL = dictionary[posterKey] as? String
            else {return nil}
        
        self.movieName = movieName
        self.rating = rating
        self.summary = summary
        self.posterURL = posterURL
    }
}
