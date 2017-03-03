//
//  MovieDetailTableViewCell.swift
//  Movies
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MovieDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let movie = movie else {return}
        DispatchQueue.main.async {
            self.summaryTextView.text = movie.summary
            self.movieNameLabel.text = movie.movieName
            self.ratingLabel.text = "\(movie.rating)/10"
            ImageController.image(forURL: movie.posterURL) { (image) in
                self.posterImageView.image = image
                
            }
        }
        
        
    }
}
