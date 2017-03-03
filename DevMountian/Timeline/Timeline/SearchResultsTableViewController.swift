//
//  SearchResultsTableViewController.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {
    
    var results: [SearchableRecord] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        presentingViewController?.performSegue(withIdentifier: "searchResultsCell", sender: cell )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    //MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toPostDetailFromSearch", for: indexPath) as? PostTableViewCell,
        let results = self.results[indexPath.row] as? Post else { return UITableViewCell() }
        
        cell.post = results
        return cell
    }

}
