//
//  JournalListTableViewController.swift
//  JournalWithCoreData
//
//  Created by Taylor Phillips on 2/16/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import CoreData

class JournalListTableViewController: UITableViewController,NSFetchedResultsControllerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EntryController.sharedController.fetchedResultsController.delegate = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //MARK - NSFetchedResults
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let indexSet = NSIndexSet(index: sectionIndex)
        
        switch type {
            
            // this will get called if we need to insert an entire section.(this will only happen if there are no objects for a section and one is added. For example if you only have incomplete Tasks in your tableView, the you make one task complete, it will have to make a new section for complete tasks.
        case .insert:
            tableView.insertSections(indexSet as IndexSet, with: .automatic)
            
            // for delete, this will be when we  have multiople secitons, bu then remove all objects (like tasks or entries) ffrom a section, therefore the section is no longer neeed and should not be displayed on the tableView.
        case.delete:
            tableView.deleteSections(indexSet as IndexSet, with: .automatic)
        default:
            break
        }
    }
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        case.move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else {return}
            tableView.moveRow(at: indexPath, to: newIndexPath)
        }
    }
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        let sections = EntryController.sharedController.fetchedResultsController.sections?.count
        return sections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sections = EntryController.sharedController.fetchedResultsController.sections ?? []
        return sections[section].numberOfObjects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalListCell", for: indexPath)
        
        let entry = EntryController.sharedController.fetchedResultsController.object(at: indexPath)
        
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = EntryController.sharedController.fetchedResultsController.object(at: indexPath)
            EntryController.sharedController.remove(entry: entry)
            
            

        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toJournalEntry"{
            guard let indexPath = tableView.indexPathForSelectedRow, let journalEntryVC = segue.destination as? JournalEntryViewController else {return}
            
            let entry = EntryController.sharedController.fetchedResultsController.object(at: indexPath)
            journalEntryVC.entry = entry
            
        }
    }
}
