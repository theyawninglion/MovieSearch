//
//  MovieController.swift
//  MovieList
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class MovieController{
    
    static let sharedController = MovieController()
    
    //CRUD
    
    //create
    
    func createMovieWith(title: String){
        //this pulls the title from the createMovie function and adds it to the Movie class that has been called
        let _ = Movie(title: title)
        
        saveToPersitentStore()
        
    }
    
    //read
    var moviesArray: [Movie] {
        
        // exacute a fetch request to put the movies in the managed object context form the harddrive(aka persistent store)
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        let moc = CoreDataStack.context
        
        do{
            return try moc.fetch(request)
            
        } catch {
            return []
        }
    }
    //update
    func toggleHasViewedFor(movie: Movie) {
        movie.hasViewed = !movie.hasViewed
        saveToPersitentStore()
    }
    
    //delete
    
    func delete(movie: Movie){
        let moc = CoreDataStack.context
        moc.delete(movie)
        saveToPersitentStore()
    }
    //save
    func saveToPersitentStore() {
        let moc = CoreDataStack.context
        do{
            try moc.save()
        } catch {
            print("Could not save managed object context")
        }
    }
}
