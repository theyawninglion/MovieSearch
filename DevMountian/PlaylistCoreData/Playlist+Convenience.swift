//
//  Playlist+Convenience.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

extension Playlist{
    @discardableResult convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
    }
}
