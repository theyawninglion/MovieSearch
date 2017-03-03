//
//  Pokemon.swift
//  pokedex
//
//  Created by Taylor Phillips on 2/21/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit
class Pokemon{
    
    private let nameKey = "name"
    private let imageKey = "front_default"
//    private let moveNameKey = "name"
    private let moveCountKey = "moves"
    private let idKey = "id"
    private let weightKey = "weight"
    private let heightKey = "height"
    private let expKey = "base_experience"
    
    let name: String
    let imageEndpooint: String
//    let moveName: String
    let weight: Int
    let height: Int
    let exp: Int
    let moveCount: Int
    let id: Int
    var image: UIImage?
    
    
    init?(dictionary: [String:Any]){
        
        guard let  name = dictionary[nameKey] as? String,
        let spriteDictionary = dictionary["sprites"] as? [String: Any],
        let imageEndpooint = spriteDictionary[imageKey] as? String,
        let movesArray = dictionary[moveCountKey] as? [[String:Any]],
        let id = dictionary[idKey] as? Int,
        let weight = dictionary[weightKey] as? Int,
        let height = dictionary[heightKey] as? Int,
        let exp = dictionary[expKey] as? Int
            else {return nil}
        
        self.name = name
        self.imageEndpooint = imageEndpooint
        self.moveCount = movesArray.count
        self.id = id
        self.weight = weight
        self.height = height
        self.exp = exp
    }
}
