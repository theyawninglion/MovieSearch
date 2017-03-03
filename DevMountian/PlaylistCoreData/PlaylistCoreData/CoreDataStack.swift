//
//  CoreDataStack.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

import CoreData

class CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PlaylistCoreData")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { return container.viewContext }
}
