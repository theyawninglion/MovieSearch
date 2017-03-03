//
//  Post.swift
//  Post
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

struct Post{
    
    private let usernameKey = "username"
    private let textKey = "text"
    private let timestampKey = "timestamp"
    
    
    let username: String
    let text: String
    let timestamp: TimeInterval
    let identifier: UUID
    
    init(username: String, text: String, timestamp: TimeInterval = Date().timeIntervalSince1970, identifier: UUID = UUID()){
        self.username = username
        self.text = text
        self.timestamp = timestamp
        self.identifier = identifier
    }
    init?(dictionary:[String:Any], identifier: String){
        guard let username = dictionary[usernameKey] as? String,
        let text = dictionary[textKey] as? String,
        let timestamp = dictionary[timestampKey] as? TimeInterval,
        let identifier = UUID(uuidString: identifier)
            else {return nil}
        
        self.username = username
        self.text = text
        self.timestamp = timestamp
        self.identifier = identifier
    }
    
    var jsonRepresentation: [String:Any] {
        return [usernameKey: username, textKey: text, timestampKey: timestamp]
    }
    var jsonData: Data? {
        let data = try? JSONSerialization.data(withJSONObject: jsonRepresentation, options: .prettyPrinted)
        return data
    }
}
