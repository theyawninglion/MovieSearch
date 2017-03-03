//
//  TaskController.swift
//  TaskCoreData
//
//  Created by Taylor Phillips on 2/15/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import CoreData

class TaskController{
    static let sharedController = TaskController()
    
    
    var fetchedResultsController: NSFetchedResultsController<Task>
    
    init(){
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        let sortDescriptorComplete = NSSortDescriptor(key: "isComplete", ascending: false)
        let sortDescriptorDue = NSSortDescriptor(key: "due", ascending: false)
        request.sortDescriptors = [sortDescriptorComplete, sortDescriptorDue]
        
        let moc = CoreDataStack.context
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: moc, sectionNameKeyPath: "isComplete", cacheName: nil)
        do{
            try self.fetchedResultsController.performFetch()
        }catch{
            print("Couldn't fetch tasks from the moc through FRC")
        }
        
    }
    func toggleIsCompleteFor(task: Task){
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    //crud
    
    //create
    func add(taskWithName name: String, notes: String?, due: Date?){
        let _ = Task(name: name, notes: notes, due: due)
        
        saveToPersistentStore()
    }
    //run
        
    //update
    func update(task: Task, name: String, notes: String?, due: Date?){
        task.name = name
        task.notes = notes
        task.due = due as NSDate?
        saveToPersistentStore()
       
    }
    //delete
    func remove(task: Task){
        let moc = CoreDataStack.context
        moc.delete(task)
        saveToPersistentStore()
    }
    //save
    func saveToPersistentStore(){
        let moc = CoreDataStack.context
        do{
            try moc.save()
        }catch{
            print("You to fat, can't save to persistence")
        }
    }
    
    
}
