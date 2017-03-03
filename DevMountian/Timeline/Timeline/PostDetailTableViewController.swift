//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    //MARK: - Properties
    
    var post: Post?
    
    //MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 250
        
    }
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        commentAlert()
        
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        
        presentActivitViewController()
    }
    
    @IBAction func followButtonTapped(_ sender: Any) {
        
    }
    //MARK: - Action Functions & Alerts
    
    func commentAlert() {
        
        let commentAlertController = UIAlertController(title: "Comment", message: "Add comments", preferredStyle: .alert)
        
        var commentTextField: UITextField?
        
        commentAlertController.addTextField(configurationHandler: { (textField) in
            
            commentTextField = textField
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let addCommentAction = UIAlertAction(title: "OK", style: .default) { (_) in
            guard let commentText = commentTextField?.text, let post  = self.post else { return }
            PostController.sharedController.addComment(toPost: post, text: commentText)
        }
        
        commentAlertController.addAction(cancelAction)
        commentAlertController.addAction(addCommentAction)
    }
    
    func presentActivitViewController() {
        guard let photo = post?.photo, let comment = post?.comments.first else { return }
        
        let text = comment.text
        let activityViewController = UIActivityViewController(activityItems: [photo, text], applicationActivities: nil)
        
        present(activityViewController, animated: true, completion: nil)
    }
    
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return PostController.sharedController.posts.count
        }
    

        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postDetailCell", for: indexPath) as? PostTableViewCell ?? PostTableViewCell()
            let post = PostController.sharedController.posts[indexPath.row]
            
            cell.post = post
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
        // MARK: - Navigation
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            
    }
}
