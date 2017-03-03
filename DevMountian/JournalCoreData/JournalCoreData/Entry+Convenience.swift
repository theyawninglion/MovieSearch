//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Entry{
    convenience init(title: String, body: String?, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.body = body
        self.timeStamp = timeStamp as NSDate
    }
}
