//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, MovieButtonTableViewCellDelegate{
    @IBAction func addMovieButtonTapped(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Add a movie", message: "Enter the name of the movie you want to watch below", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        var movieTitleTextField: UITextField?
        alertController.addTextField{ (textField) in
            
            movieTitleTextField = textField
        
        }
        
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            
            guard let title = movieTitleTextField?.text else { return }
            
            
            MovieController.sharedController.createMovieWith(title: title)
            self.tableView.reloadData()
            
        }
        alertController.addAction(submitAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func movieCellButtonTapped(sender: MovieTableViewCell) {
        guard let movie = sender.movie, let indexPath = tableView.indexPath(for: sender) else {return}
        MovieController.sharedController.toggleHasViewedFor(movie: movie)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieController.sharedController.moviesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)/* cast*/ as? MovieTableViewCell else { return UITableViewCell()} /*casting from the cellView*/
        
        let movie = MovieController.sharedController.moviesArray[indexPath.row]
        
        cell.movie = movie
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
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
       
        
        
        
        
        
    }
}
