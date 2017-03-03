//
//  Keys.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation

struct Constants {
    
    //MARK: - CloudKitKeys
    
    static let postRecordType = "Post"
    static let postTextKey = "postText"
    static let postDateKey = "postDate"
    
    //MARK: - UITableViewCell Reuse Identifiers
    
    static let postCellReuseIdentifier = "postCell"
    
    //MARK: - Notification Center Names
    
    static let DidRefreshNotification = Notification.Name("DidRefreshNotification")
}
