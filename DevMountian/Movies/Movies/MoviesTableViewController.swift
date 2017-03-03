//
//  MoviesTableViewController.swift
//  Movies
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var movies: [Movie] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.resignFirstResponder()
        guard let searchTerm = searchBar.text else{ return }
        MovieController.seachMovies(movieName: searchTerm) { (movie) in
            DispatchQueue.main.async {
                self.movies = movie
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath) as? MovieDetailTableViewCell ?? MovieDetailTableViewCell()
        let movie = movies[indexPath.row]
        
        cell.movie = movie
        
        
        return cell
    }
    
  }
