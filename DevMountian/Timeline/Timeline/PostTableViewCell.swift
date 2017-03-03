//
//  PostTableViewCell.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    var post: Post? {
        didSet{
            DispatchQueue.main.async {
                
                self.updateViews()
                
            }
        }
    }
    
    func updateViews() {
        guard let post = post else { return }
        self.postImageView.image = post.photo
        
        
        
    }

}
