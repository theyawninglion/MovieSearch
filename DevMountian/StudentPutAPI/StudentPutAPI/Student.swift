//
//  Student.swift
//  StudentPutAPI
//
//  Created by Taylor Phillips on 2/22/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
class Student {
    private let nameKey = "nombre"
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    init?(dictionary: [String:String]) {
        guard let name = dictionary[nameKey]
            else {return nil}
        
        self.name = name
    }
    
    var dictionaryRepresentation: [String:String] {
        return [nameKey:name]
        //for multiple dictionary key:value pairs
//        return [nameKey:name, ageKey:age, timeKey:time]

    }
    var jsonData: Data? {
        let data = try? JSONSerialization.data(withJSONObject: dictionaryRepresentation, options: .prettyPrinted)
        return data
    }
}
