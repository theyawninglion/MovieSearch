//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

class Card {
    
    private let suitKey = "suit"
    private let valueKey = "value"
    private let imageKey = "image"
    
    let suit: String
    let value: String
    let imageURL: String
    
    init?(dictionary: [String: Any]) {
        
        guard let suit = dictionary[suitKey] as? String,
            let value = dictionary[valueKey] as? String,
            let imageURL = dictionary[imageKey] as? String
            else { return nil }
        
        self.suit = suit
        self.value = value
        self.imageURL = imageURL
        
    }
}
