//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Taylor Phillips on 2/3/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesController.sharedController.notesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        
        let notesCell = NotesController.sharedController.notesArray[indexPath.row]
        
        cell.textLabel?.text = notesCell.notesProperty
        
        return cell
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let notes = NotesController.sharedController.notesArray[indexPath.row]
            NotesController.sharedController.delete(notes: notes)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "toEditNotes"{
            
            if let indexPath = tableView.indexPathForSelectedRow{
                let notesToBePassed = NotesController.sharedController.notesArray[indexPath.row]
                if let notesVC = segue.destination as? NotesViewController{
                    notesVC.notesPlaceHolder = notesToBePassed
                }
            }
        }
    }
}
