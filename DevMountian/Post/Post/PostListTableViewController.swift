//
//  PostListTableViewController.swift
//  Post
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, PostControllerDelegate {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath as NSIndexPath).row+1 == postController.posts.count{
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            postController.fetchPosts(reset: false, completion: { (posts) in
                if !posts.isEmpty{
                    self.tableView.reloadData()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            })
        }
    }
    
    @IBAction func refreshControlAction(_ sender: UIRefreshControl) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        postController.fetchPosts(reset: true) { (_) in
            sender.endRefreshing()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
    }
    @IBAction func addButtonTapped(_ sender: Any) {
        
       presentNewPostAlert()
        
        
        
    }
    
    func presentNewPostAlert(){
        
        let newPostAlertController = UIAlertController(title: "Add post", message: "Enter an username and comments", preferredStyle: .alert)
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
         
        var usernameTextField: UITextField?
        var messageTextField: UITextField?

        newPostAlertController.addTextField { (usernameTextField1) in
            usernameTextField = usernameTextField1
            usernameTextField?.placeholder = "Enter name"
        }
        newPostAlertController.addTextField { (messageTextField1) in
            messageTextField = messageTextField1
            messageTextField?.placeholder = "Enter message"
            
        }
        let addAlertAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let username = usernameTextField?.text, let text = messageTextField?.text else{ return }
            
            if username.characters.count == 0 || text.characters.count == 0
            {
                self.presentErrorAlert()
            }else{
            
            self.postController.addNewPostWith(username: username, text: text, completion: { (_) in

            })
            }
        }
        newPostAlertController.addAction(cancelAlertAction)
        newPostAlertController.addAction(addAlertAction)

        self.present(newPostAlertController, animated: true, completion: nil)
    }
    
    func presentErrorAlert(){
        let errorAlertController = UIAlertController(title: "Alert", message: "Empty text field! \nBoth text fields need to have something in them before you can submit.", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel) { (_) in
            self.presentNewPostAlert()
        }
        
        errorAlertController.addAction(dismissAction)
        
        self.present(errorAlertController, animated: true, completion: nil)
        
    }

    var postController = PostController()
    
    func postsWereUpdatedTo(post: [Post], on postController: PostController) {
        tableView.reloadData()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 350
        tableView.rowHeight = UITableViewAutomaticDimension
        postController.delegate = self
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postController.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath)
        let post = postController.posts[indexPath.row]
        
        cell.textLabel?.text = post.text
        cell.detailTextLabel?.text = "\(post.username) - \(post.timestamp)"
        
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
