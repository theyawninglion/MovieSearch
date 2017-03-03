//
//  ResponsesTableViewController.swift
//  EmojiSurvey
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class ResponsesTableViewController: UITableViewController {
    
    @IBAction func refreshControlPulledDown(_ sender: UIRefreshControl) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        SurveyController.fetchResponses { (_) in
            sender.endRefreshing()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }

    var surveys: [Survey] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.fetchResponses { (survey) in
            self.surveys = survey
        }
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            
                SurveyController.fetchResponses(completion: { (surveys) in
                    self.surveys = surveys
                })
            
        }
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return surveys.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "reponseCell", for: indexPath)
            
            let survey = surveys[indexPath.row]
            cell.textLabel?.text = survey.name
            cell.detailTextLabel?.text = survey.favoriteEmoji
            
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
