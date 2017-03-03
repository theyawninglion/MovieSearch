//
//  MoviesListTableViewController.swift
//  MovieSearch
//
//  Created by Taylor Phillips on 2/24/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MoviesListTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let searchTerm = searchBar.text else { return }
        MovieController.searchMovie(movieName: searchTerm) { (movie) in
            DispatchQueue.main.async {
                self.movies = movie
            }
            self.resignFirstResponder()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        searchBar.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
            Thread.sleep(forTimeInterval: 1)
        
        searchBar.delegate = self
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieDetailCell", for: indexPath) as? MovieDetailsTableViewCell ?? MovieDetailsTableViewCell()
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        
        return cell
    }
    
}
