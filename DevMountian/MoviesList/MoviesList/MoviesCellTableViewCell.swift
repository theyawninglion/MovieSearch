//
//  MoviesCellTableViewCell.swift
//  MoviesList
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MoviesCellTableViewCell: UITableViewCell {
    
    weak var delegate: IsWatchedButtonMoviesCellTableViewCellDelegate?
    
    @IBOutlet weak var isWatchedButton: UIButton!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBAction func isWatchedButtonTapped(_ sender: UIButton) {
        delegate?.isWatchButtonTapped(sender: self)
    }
    
    
    var movies: Movies?{
        didSet{
            updateViews()
        }
    }
    
    private func updateViews(){
        guard let movies = movies else {return movieNameLabel.text = ""}
        movieNameLabel.text = movies.movieName
        
        let isWatchedImage = movies.isWatched ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        isWatchedButton.setImage(isWatchedImage, for: .normal)
        
    }
    
}
protocol IsWatchedButtonMoviesCellTableViewCellDelegate: class {
    func isWatchButtonTapped(sender: MoviesCellTableViewCell)
}

