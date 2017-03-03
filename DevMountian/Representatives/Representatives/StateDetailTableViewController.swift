//
//  StateDetailTableViewController.swift
//  Representatives
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    
    
    var representives: [Representative] = []{
        didSet{
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let state = state else {return}
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        RepresentativeController.searchRepresentatives(forState: state) { (representive) in
            self.representives = representive
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return representives.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? StateDetailTableViewCell ?? StateDetailTableViewCell()
        let representive = representives[indexPath.row]
        
        cell.representative = representive
        
        
        return cell
    }
    
}
