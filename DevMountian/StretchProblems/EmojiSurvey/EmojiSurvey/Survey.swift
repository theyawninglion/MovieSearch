//
//  Survey.swift
//  EmojiSurvey
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
struct Survey{
    
    private let nameKey = "name"
    private let emojiKey = "emoji"
    private let uuidKey = "uid"
    
    let name: String
    let favoriteEmoji: String
    let uuid: UUID
   //get data
    init?(dictionary: [String:String], identifier: String){
        guard let name = dictionary[nameKey],
        let favoriteEmoji = dictionary[emojiKey],
        let uuid = UUID(uuidString: identifier)
            
            else {return nil}
        
        self.name = name
        self.favoriteEmoji = favoriteEmoji
        self.uuid = uuid
        
    }
    // put or post data
    init(name: String, favoriteEmoji: String, uuid: UUID = UUID()){
        self.name = name
        self.favoriteEmoji = favoriteEmoji
        self.uuid = uuid
    }
    
    var dictionaryRepresentation: [String:String] {
        return [nameKey:name, emojiKey:favoriteEmoji]
    }
    var jsonData: Data?{
        return try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
    }
}
