//
//  TaskListTableViewController.swift
//  TaskCoreData
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import CoreData

class TaskListTableViewController: UITableViewController, ButtonTableViewCellDelegate, NSFetchedResultsControllerDelegate {
    
    //Mark fetchedResultsController
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
            
        case .insert:
            guard let newIndexPath = newIndexPath else {return}
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case .move:
            guard let newIndexPath = newIndexPath, let indexPath = indexPath else {return}
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = NSIndexSet(index: sectionIndex)
        
        switch type {
        case .insert:
            tableView.insertSections(indexSet as IndexSet, with: .automatic)
        case.move:
            tableView.moveSection(1, toSection: 0)
//            tableView.moveSection(0, toSection: 1)
        case.update:
            tableView.reloadSections(indexSet as IndexSet, with: .automatic)
        case.delete:
            tableView.deleteSections(indexSet as IndexSet, with: .automatic)
        
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    //MARK - Basic set up
    
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else {return}
        let task = TaskController.sharedController.fetchedResultsController.object(at: indexPath)
        TaskController.sharedController.toggleIsCompleteFor(task: task)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskController.sharedController.fetchedResultsController.delegate = self
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sections = TaskController.sharedController.fetchedResultsController.sections ?? []
        return sections[section].name
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        let sections = TaskController.sharedController.fetchedResultsController.sections?.count
        return sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = TaskController.sharedController.fetchedResultsController.sections ?? []
        return sections[section].numberOfObjects
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath)as? ButtonTableViewCell else {return UITableViewCell()}
        let task = TaskController.sharedController.fetchedResultsController.object(at: indexPath)
        
        cell.task = task
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.sharedController.fetchedResultsController.object(at: indexPath)
            TaskController.sharedController.remove(task: task)
           
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "taskListCell"{
            guard let indexPath = tableView.indexPathForSelectedRow, let taskDetailTVC = segue.destination as? TaskDetailTableViewController else {return}
            let task = TaskController.sharedController.fetchedResultsController.object(at: indexPath)
            taskDetailTVC.task = task
        }
    }
}
