//
//  DateHelpers.swift
//  TaskCoreData
//
//  Created by Taylor Phillips on 2/15/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Date{
    func stringValue() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: self)
    }
}
