//
//  NotesModel.swift
//  Notes
//
//  Created by Taylor Phillips on 2/3/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import Foundation

class NotesClass: Equatable{
    
    static func ==(lhs: NotesClass, rhs: NotesClass) ->Bool{
        return lhs.notesProperty == rhs.notesProperty
    }
    
    private let notesKey = "notes"
    
    let notesProperty:String
    
    init(notes: String) {
        self.notesProperty = notes
    }
    
    
    var dictionaryRepresentation: [String: String]{
        
        let dictionary = [notesKey: notesProperty]
        return dictionary
        
    }
    
    
    init?(dictionary: [String:String]){
        if let notes = dictionary[notesKey]{
            self.notesProperty = notes
        }else{
            return nil
        }
    }
}
