//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class EntryController{
     static let shared = EntryController()
    
    var entriesArray: [Entry]{
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        
        return (try? CoreDataStack.context.fetch(request)) ?? []
        
//        do {
//            return try CoreDataStack.context.fetch(request)
//        }catch{
//            return []
//        }
    
    
    }
    func delete(entry: Entry) {
        entry.managedObjectContext?.delete(entry)
        saveToPersistentStore()
        
    }
    
    func saveToPersistentStore() {
        do{
            try CoreDataStack.context.save()
        }catch let error {
            print("Error saving MOC:\n\(error)")
        }
        
    }
    
    
    
    
}
