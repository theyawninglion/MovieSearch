//
//  PlaylistController.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    var playlistsArray: [Playlist] {
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
    
    //MARK: CRUD Operations
    
    func create(playlistWithName name: String) {
        let _ = Playlist(name: name)
        
    }
    func delete(playlist: Playlist) {
        if let moc = playlist.managedObjectContext {
            moc.delete(playlist)
            saveToPersistentStore()
        }
        
    }
    func saveToPersistentStore()  {
        let moc = CoreDataStack.context
        do {
            try moc.save()
        } catch let  error {
            print("There was a problem saving to the persistent store:\n\(error)")
        }
    }
    
}
