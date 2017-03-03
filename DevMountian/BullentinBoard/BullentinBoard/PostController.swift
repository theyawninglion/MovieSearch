//
//  PostController.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CloudKit
import NotificationCenter

class PostController {
    
    static let shared = PostController()
    private(set) var posts = [Post]() {
        didSet{
            //Implement notifiction for when posts are set.
            DispatchQueue.main.async {
                let notificationCenter = NotificationCenter.default
                notificationCenter.post(name: Constants.DidRefreshNotification, object: self)
            }
        }
    }
    private let cloudKitManager = CloudKitManager()
    
    init() {
        //Refresh data
    }
    func create(postText: String, date: Date = Date(), completion: @escaping ((Error?) -> Void) = { _ in }) {
        let post = Post(postText: postText, date: date)
        cloudKitManager.save(post.cloudKitRecord) { (error) in
            defer { completion(error) }
            //defer { completion(error) }  runs the completion error before every return so you don't have to type it out every time.
            
            if let error = error {
                NSLog("Error saving \(post.postText) to cloudkit with error:\n\(error)")
                return
            }
            self.posts.insert(post, at: 0)
        }
    }
    func refreshData(completion: @escaping ((Error?) -> Void) = { _ in }) {
        
        let sortDescriptor = [NSSortDescriptor(key: Constants.postDateKey, ascending: false)]
        cloudKitManager.fetchRecords(ofType: Constants.postRecordType, withsortDescriptors: sortDescriptor) { (records, error) in
            defer { completion(error) }
            if let error = error {
                NSLog("Error fetvhing posts:\n\(error)")
                return
            }
            guard let records = records else { return }
            self.posts = records.flatMap { Post(cloudKitRecord: $0)}
        }
        
    }
    func subcribeToPushNotification(completion: @escaping ((Error?) -> Void) = { _ in }){
        cloudKitManager.subscriveToCreationOfRecords(withType: Constants.postRecordType) { (error) in
            
            if let error = error {
                NSLog("Subscribed to push notifications for new posts.")
                
            } else {
                NSLog(" Subscribed to push notifications for new posts.")
            }
            completion(error)
        }
    }
}
