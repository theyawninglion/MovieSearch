//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntryListTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Journal"
    
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entriesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath)
        let entry = EntryController.shared.entriesArray[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let entry = getEntry(atIndexPath: indexPath)
            EntryController.shared.delete(entry: entry)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func getEntry(atIndexPath indexPath: IndexPath) -> Entry {
        return EntryController.shared.entriesArray[indexPath.row]
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toEntryDetailSegue"{
            guard let destinationVC = segue.destination as? EntryDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow else {return}
            let entry = getEntry(atIndexPath: indexPath)
            destinationVC.loadViewIfNeeded()
            destinationVC.entry = entry
        }
    }
}
