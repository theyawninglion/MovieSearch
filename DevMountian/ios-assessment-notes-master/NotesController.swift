//
//  NotesController.swift
//  Notes
//
//  Created by Taylor Phillips on 2/3/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class NotesController{
    
    static let sharedController = NotesController()
    
    init() {
        loadFromPersistenceStore()
    }
    
    private let notesDictionaryArrayKey = "notesDictonaryArray"
    var notesArray: [NotesClass] = []
    
    func addNewNotes(notes: String){
        let newNotes = NotesClass(notes: notes)
        notesArray.append(newNotes)
        
        saveToPersistenceStore()
    }
    func delete(notes: NotesClass){
        
        if let index = notesArray.index(of: notes){
            
            notesArray.remove(at: index)
            
            saveToPersistenceStore()
        }
        
    }
    
    func saveToPersistenceStore(){
        
        var notesDictionaryArray: [[String: String]] = []
        
        for notes in notesArray {
            
            let notesDictionary = notes.dictionaryRepresentation
            notesDictionaryArray.append(notesDictionary)
        }
        UserDefaults.standard.set(notesDictionaryArray, forKey: notesDictionaryArrayKey)
        
    }
    
    
    func loadFromPersistenceStore(){
        if let notesDictionaryArray = UserDefaults.standard.value(forKey: notesDictionaryArrayKey) as? [[String:String]]{
            
            var notesArray: [NotesClass] = []
            
            for notesDictionary in notesDictionaryArray{
                if let notes = NotesClass(dictionary: notesDictionary){
                    notesArray.append(notes)
                }
            }
            self.notesArray = notesArray
        }
    }
}
