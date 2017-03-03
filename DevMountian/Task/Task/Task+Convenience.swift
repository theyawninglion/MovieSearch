//
//  Task+Convenience.swift
//  Task
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Task{
    @discardableResult convenience init(name: String, notes: String, due: Date, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
    }
}
