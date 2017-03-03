//
//  Weather.swift
//  Weather
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    private let nameKey = "name"
    private let descriptionKey = "description"
    private let tempKey = "temp"
    private let iconURLKey = "icon"
    
    let name: String
    let description: String
    let temp: Double
    let iconURL: String
    var icon: UIImage?
    
    init?(dictionary: [String: Any]){
        guard let name = dictionary[nameKey] as? String,
        let weatherArray = dictionary["weather"] as? [[String:Any]],
        let weatherDictionary = weatherArray.first,
        let description = weatherDictionary[descriptionKey] as? String,
        let iconURL = weatherDictionary[iconURLKey] as? String,
        let mainDictionary = dictionary["main"] as? [String:Any],
        let temp = mainDictionary[tempKey] as? Double
            
            else {return nil}
        
        self.name = name
        self.description = description
        self.temp = temp
        self.iconURL = iconURL
    }
}
