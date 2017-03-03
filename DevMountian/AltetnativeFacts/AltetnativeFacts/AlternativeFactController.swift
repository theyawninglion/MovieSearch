//
//  AlternativeFactController.swift
//  AltetnativeFacts
//
//  Created by Taylor Phillips on 3/2/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CloudKit

class AlternativeFactController {
    
    static let publicDatabase = CKContainer.default().publicCloudDatabase
    
    static func sendAlternativeFactToCloudKit(alternativeFactString: String) {
        
        let alternativeFact = AlternativeFact(fact: alternativeFactString)
        
        let alternativeFactRecord = alternativeFact.cloudKitRecord
        
        publicDatabase.save(alternativeFactRecord) { (_, error) in
        
            if let error = error { print(error.localizedDescription) }
        }
        
    }
    static func fetchAlternativeFactsFromCloudKit(completion: @escaping ([AlternativeFact]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "AlternativeFact", predicate: predicate)
        
        publicDatabase.perform(query, inZoneWith: nil) { (records, error) in
            
            guard let records = records else { return }
            
            let facts = records.flatMap({AlternativeFact(cloudKitRecord: $0) })
            
            completion(facts)
        }
    }

    
}
