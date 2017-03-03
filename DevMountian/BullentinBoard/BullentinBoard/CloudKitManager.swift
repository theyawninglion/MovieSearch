//
//  CloudKitController.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CloudKit

class CloudKitManager {
    
    let publicDatabase = CKContainer.default().publicCloudDatabase
    
    func fetchRecords(ofType type: String, withsortDescriptors sortDescriptors: [NSSortDescriptor]? = nil, completion: @escaping ([CKRecord]?, Error?) -> Void) {
        
        let query = CKQuery(recordType: type, predicate: NSPredicate(value: true))
        query.sortDescriptors = sortDescriptors
        publicDatabase.perform(query, inZoneWith: nil, completionHandler: completion)
        
    }
    func save(_ record: CKRecord, completion: @escaping ((Error?)) -> Void = { _ in }) {
        publicDatabase.save(record) { (_, error) in
            completion(error)
        }
        
    }
    func subscriveToCreationOfRecords(withType type: String, completion: @escaping ((Error?) -> Void) = { _ in}) {
        let subscription = CKQuerySubscription(recordType: type, predicate: NSPredicate(value: true), options: .firesOnRecordCreation)
        let notificationInfo = CKNotificationInfo()
        notificationInfo.alertBody = "There's a new post on the bulletin board!"
        subscription.notificationInfo = notificationInfo
        publicDatabase.save(subscription) { (_, error) in
            if let error = error {
                NSLog("Error saving subscription:\n\(error)")
            }
            completion(error)
        }
    }
}
