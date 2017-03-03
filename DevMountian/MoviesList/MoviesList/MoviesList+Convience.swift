//
//  MoviesList+Convience.swift
//  MoviesList
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData
extension Movies {
    @discardableResult convenience init(isWatched: Bool = false, movieName: String, context: NSManagedObjectContext = CoreDataStack.context ){
        self.init(context: context)
        self.isWatched = isWatched
        self.movieName = movieName
    }
}
