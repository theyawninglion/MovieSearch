//
//  PowerNap+Convience .swift
//  PowerNapCoreData
//
//  Created by Taylor Phillips on 2/17/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData
extension Timer {
    @discardableResult convenience init(timeRemaining: Double, isOn: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.timeRemaining = timeRemaining as TimeInterval
        self.isOn = isOn
             {
            return timeRemaining != nil
        }
    }
}
