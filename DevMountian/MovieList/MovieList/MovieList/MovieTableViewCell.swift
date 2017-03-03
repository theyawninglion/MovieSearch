//
//  MovieTableViewCell.swift
//  MovieList
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkboxButtton: UIButton!
    
    weak var delegate: MovieButtonTableViewCellDelegate?
    
    @IBAction func checkboxButtonTapped(_ sender: Any) {
        delegate?.movieCellButtonTapped(sender: self)
    }
    
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    private func updateViews() {
        guard let movie = movie else { titleLabel.text = ""; return }
        titleLabel.text = movie.title
        
        let image = movie.hasViewed ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        checkboxButtton.setImage(image, for: .normal)
            
        }
}

protocol MovieButtonTableViewCellDelegate: class {
    
    func movieCellButtonTapped(sender: MovieTableViewCell)
    
    
    
}
