//
//  PostListTableViewController.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    @IBOutlet weak var postTextField: UITextField!
    
    @IBAction func postButtonTapped(_ sender: Any) {
        guard let postText = postTextField.text else { return }
        
        PostController.shared.create(postText: postText) { (_) in
        
            DispatchQueue.main.async {
                self.postTextField.text = nil
                self.postTextField.resignFirstResponder()
            }
        }
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(postsWereUpdated), name: Constants.DidRefreshNotification, object: nil)
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return PostController.shared.posts.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCellReuseIdentifier, for: indexPath)
            let post = PostController.shared.posts[indexPath.row]
            
            cell.textLabel?.text = post.postText
            cell.detailTextLabel?.text = dateFormatter.string(from: post.date)
            return cell
        }
    

    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.doesRelativeDateFormatting = true
        return formatter
    } ()
    
    func postsWereUpdated() {
        tableView.reloadData()
    }
}

