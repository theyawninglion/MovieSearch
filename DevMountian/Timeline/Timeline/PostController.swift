//
//  PostController.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let sharedController = PostController()
    var posts: [Post] = []
    
    func createPostWith(image: UIImage, caption: String, completion:((Post) -> Void)?){
        
        guard let photoData = UIImageJPEGRepresentation(image, 0.4) else { return }
        
        let post = Post(photoData: photoData)
        posts.append(post)
        let captionComment = addComment(toPost: post, text: caption)
        
        
    }
    func addComment(toPost: Post, text: String){
       let comment =  Comment(text: text, post: toPost)
        toPost.comments.append(comment)
    }
}
