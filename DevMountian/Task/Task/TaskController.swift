//
//  TaskController.swift
//  Task
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class TaskController{
    
    static let shared = TaskController()
    
    var tasksArray: [Task] = []
    
    func add(taskWithName name: String, notes: String?, due: Date?){
        
    }
    func update(task: Task, notes: String?, due: Date?){
        
    }
    func remove(task: Task){
        
    }
    
    func saveToPersistentStore(){
        
    }/*
    func fetchTask() -> [Task]{
        
    }
    
    init(){
        let mockTask = Task(name: "Test", notes: "abc123", due: <#T##Date#>)
        
        tasksArray = [mockTask]
    }
 */
}
