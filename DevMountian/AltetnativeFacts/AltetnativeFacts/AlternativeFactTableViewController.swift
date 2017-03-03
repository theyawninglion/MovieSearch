//
//  AlternativeFactTableViewController.swift
//  AltetnativeFacts
//
//  Created by Taylor Phillips on 3/2/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class AlternativeFactTableViewController: UITableViewController {
    
    var alternativeFacts: [AlternativeFact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        AlternativeFactController.fetchAlternativeFactsFromCloudKit { (alternativeFacts) in
            self.alternativeFacts = alternativeFacts
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alternativeFacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factCell", for: indexPath)
        let fact = alternativeFacts[indexPath.row]
        cell.textLabel?.text = fact.fact
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
