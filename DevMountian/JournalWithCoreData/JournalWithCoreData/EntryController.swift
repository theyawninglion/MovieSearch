//
//  EntryController.swift
//  JournalWithCoreData
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class EntryController{
    static let sharedController = EntryController()
    
    let fetchedResultsController: NSFetchedResultsController<Entry>
    
    init() {
        let request: NSFetchRequest<Entry> = Entry.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "timestamp", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        let moc = CoreDataStack.context
        
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
        do{
            try self.fetchedResultsController.performFetch()
        }catch{
            print("couldn't fetch Entries form moc through FRC")
        }
        
    }
    //crud
    //create
    func addEntryWith(title: String, bodyText: String){
        let _ = Entry(bodyText: bodyText, title: title, timeStamp: Date())
        
        saveToPersistenceStore()
    }
    //run
    var entriesArray: [Entry] = []
    //update
    func updateEntry(entry: Entry, with title: String, bodyText: String){
        entry.bodyText = bodyText
        entry.title = title
        
        saveToPersistenceStore()
    }
    //delete
    func remove(entry: Entry){
        let moc = CoreDataStack.context
        moc.delete(entry)
        saveToPersistenceStore()
    }
    //save
    func saveToPersistenceStore(){
        let moc = CoreDataStack.context
        do{
            try moc.save()
        }catch{
            print("couldn't save to persistence store")
        }
    }
}
