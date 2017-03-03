//
//  MovieDetailsTableViewCell.swift
//  MovieSearch
//
//  Created by Taylor Phillips on 2/24/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MovieDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextView!
    
    
    var movie: Movie? {
        didSet{
            DispatchQueue.main.async {
                self.updatViews()
            }
        }
    }
    
    func updatViews() {
        guard let movie = movie else { return }
        
        self.movieNameLabel.text = movie.movieName
        self.ratingLabel.text = "\(movie.rating)/10"
        self.releaseDateLabel.text = movie.releaseDate
        self.overviewTextView.text = movie.overview
        self.posterImageView.image = movie.posterImage
        
        
    }
    
}
