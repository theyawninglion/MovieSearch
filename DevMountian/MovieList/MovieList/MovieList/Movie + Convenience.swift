//
//  Movie + Convenience.swift
//  MovieList
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
    @discardableResult convenience init(title: String, hasViewed: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        
        self.init(context: context)
        self.title = title
        self.hasViewed = hasViewed
        
    }
    
}
