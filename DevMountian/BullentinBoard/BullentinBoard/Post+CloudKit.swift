//
//  Post+CloudKit.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CloudKit

extension Post {
    
    init?(cloudKitRecord: CKRecord) {
        guard let postText = cloudKitRecord[Constants.postTextKey] as? String,
        let date = cloudKitRecord.creationDate ?? (cloudKitRecord[Constants.postDateKey] as? Date),
        cloudKitRecord.recordType == Constants.postRecordType else { return nil }
        self.init(postText: postText, date: date)
    }
    
    var cloudKitRecord: CKRecord {
        let record = CKRecord(recordType: Constants.postRecordType)
        record[Constants.postTextKey] = postText as CKRecordValue?
        record[Constants.postDateKey] = date as NSDate
        return record
    }
}
