//
//  Entry+Convenience.swift
//  JournalWithCoreData
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    @discardableResult convenience init(bodyText: String, title: String, timeStamp: Date, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.bodyText = bodyText
        self.title = title
        self.timestamp = timeStamp as NSDate?
        
    }
    
}
