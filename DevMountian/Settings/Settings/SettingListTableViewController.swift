//
//  SettingListTableViewController.swift
//  Settings
//
//  Created by Taylor Phillips on 2/6/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SettingListTableViewController: UITableViewController, SettingTableViewCellDelegate {
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SettingController.sharedController.mySettings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingTableViewCell ?? SettingTableViewCell()
        let setting = SettingController.sharedController.mySettings[indexPath.row]
        cell.setting = setting
        cell.delegate = self
        // Configure the cell...
        
        
        return cell
    }

    
    // MARK: - Setting Cell Delegate
    func settingValueChanged(_ cell: SettingTableViewCell, seleced: Bool) {
        guard let  setting = cell.setting,
            let cellIndexPath = tableView.indexPath(for: cell) else {return }
        tableView.beginUpdates()
        setting.isSet = seleced
        tableView.reloadRows(at: [cellIndexPath], with: .automatic)
        tableView.endUpdates()
    }
}
