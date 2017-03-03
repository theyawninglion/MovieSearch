//
//  SongController.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class SongController {
    
    static func create(songWithTitle title: String, andArtist artist: String, inPlaylist playlist: Playlist) {
        let _ = Song(title: title, artist: artist, playlist: playlist)
        PlaylistController.shared.saveToPersistentStore()
    }
    
    static func delete(song: Song) {
        if let moc = song.managedObjectContext {
            moc.delete(song)
            PlaylistController.shared.saveToPersistentStore()
        }
    }
}
