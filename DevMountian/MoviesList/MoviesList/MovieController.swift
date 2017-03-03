//
//  MovieController.swift
//  MoviesList
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class MovieController{
    
    let moc = CoreDataStack.context
    
    static let sharedController = MovieController()
    //crud
    func completeButtonTapped(moviesList movie: Movies){
        movie.isWatched = !movie.isWatched
        saveToPersistenceStore()
        
    }
    
    //create
    func addMovie(movieName:String){
        let _ = Movies(movieName: movieName)
        saveToPersistenceStore()
    }
    //read
    var moviesArray: [Movies] {
        let request: NSFetchRequest<Movies> = Movies.fetchRequest()
        do{
            return try moc.fetch(request)
        }catch{
            
            return []
        }
    }
    
    
    //delete
    func delete(movie: Movies){
        moc.delete(movie)
        saveToPersistenceStore()
    }
    //save
    func saveToPersistenceStore(){
        do{
            try moc.save()
        }catch{
            print("can't save to the Persitence store")
        }
    }
}
