//
//  MoviesListTableViewController.swift
//  MoviesList
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MoviesListTableViewController: UITableViewController, IsWatchedButtonMoviesCellTableViewCellDelegate{
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add movie to list", message: "Enter a movie you haven't seen", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var movieNameTextField: UITextField?
        alertController.addTextField { (textField) in
            movieNameTextField = textField
            
        }
        let addMovieAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let movieName = movieNameTextField?.text else {return}
            MovieController.sharedController.addMovie(movieName: movieName)
            
            self.tableView.reloadData()
            
        }
        alertController.addAction(cancleAction)
        alertController.addAction(addMovieAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    func isWatchButtonTapped(sender: MoviesCellTableViewCell) {
        guard let movie = sender.movies, let indexPath = tableView.indexPath(for: sender) else {return}
        MovieController.sharedController.completeButtonTapped(moviesList: movie)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            self.title = "Need To Watch Movies"
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return MovieController.sharedController.moviesArray.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieListCell", for: indexPath) as? MoviesCellTableViewCell else {return UITableViewCell()}
            let movies = MovieController.sharedController.moviesArray[indexPath.row]
            
            cell.movies = movies
            cell.delegate = self
            return cell
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                let movie = MovieController.sharedController.moviesArray[indexPath.row]
                MovieController.sharedController.delete(movie: movie)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
        
    
    }
