//
//  AlernativeFact.swift
//  AltetnativeFacts
//
//  Created by Taylor Phillips on 3/2/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CloudKit

class AlternativeFact {
    
    private let factKey = "fact"
    
    let fact: String
    var cloudKitRecordID: CKRecordID?
    init(fact: String) {
        self.fact = fact
    }
    
    init?(cloudKitRecord: CKRecord) {
        guard let fact = cloudKitRecord[factKey] as? String else { return nil }
        self.fact = fact
        self.cloudKitRecordID = cloudKitRecord.recordID
    }
    
    var cloudKitRecord: CKRecord {
        let recordID: CKRecordID = cloudKitRecordID ?? CKRecordID(recordName: UUID().uuidString)

        let record = CKRecord(recordType: "AlternativeFact", recordID: recordID)
        record.setValue(fact, forKey: factKey)
        
        return record
    }
}
