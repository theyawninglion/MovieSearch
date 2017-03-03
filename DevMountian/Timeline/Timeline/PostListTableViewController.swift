//
//  PostListTableViewController.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var searchController: UISearchController?
    
    func setUpSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "searchResultsTVC")
        
        self.searchController = UISearchController(searchResultsController: resultsController)
        
        self.tableView.tableHeaderView = searchController?.searchBar
        self.searchController?.searchResultsUpdater = self
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let resultsViewController = searchController.searchResultsController as? SearchResultsTableViewController,
            let searchTerm = searchController.searchBar.text?.lowercased() {
            
            let post = PostController.sharedController.posts
            let filteredPosts = post.filter { $0.matches(searchTerm: searchTerm) }.map { $0 as SearchableRecord }
            
            resultsViewController.results = filteredPosts
            resultsViewController.tableView.reloadData()
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedController.posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postListCell", for: indexPath)
        let post = PostController.sharedController.posts[indexPath.row]
        
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
        
        if segue.identifier == "toPostDetailTVC" {
            
            guard let indexPath = tableView.indexPathForSelectedRow, let postDetailTVC = segue.destination as? PostDetailTableViewController else { return }
            
            let infoPassed = PostController.sharedController.posts[indexPath.row]
            postDetailTVC.post = infoPassed
        }
        if segue.identifier == "toPostDetailFromSearch" {
            guard let postDetailTVC = segue.destination as? PostDetailTableViewController,
                let sender = sender as? PostTableViewCell,
                let selectedIndexPath = (searchController?.searchResultsController as? SearchResultsTableViewController)?.tableView.indexPath(for: sender),
                let searchTerm = searchController?.searchBar.text?.lowercased()
                else { return }
            
            let posts = PostController.sharedController.posts.filter({ $0.matches(searchTerm: searchTerm) })
            let post = posts[selectedIndexPath.row]
            
            postDetailTVC.post = post
            
        }
    }
}
