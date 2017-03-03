//
//  StateListTableViewController.swift
//  Representatives
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "States"
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return States.all.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateListCell", for: indexPath)
        let states = States.all[indexPath.row]
        
        cell.textLabel?.text = states
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toStateDetailTVC"{
            guard let indexPath = tableView.indexPathForSelectedRow, let stateDetailTVC = segue.destination as? StateDetailTableViewController else {return}
            let state = States.all[indexPath.row]
            stateDetailTVC.state = state
        }
    }
}
