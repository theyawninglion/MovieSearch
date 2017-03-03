//
//  SettingTableViewController.swift
//  Settings2
//
//  Created by Taylor Phillips on 2/13/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController, settingTableViewCellDelegate {
    
    func settingSwitchForCellValueChanged(cell: SettingTableViewCell, isOn: Bool) {
        
        guard let setting = cell.setting else { return }
        
        SettingController.sharedController.updateSettingSelectionFor(setting: setting, isOn: isOn)
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SettingController.sharedController.settingsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell()}
        
        let setting = SettingController.sharedController.settingsArray[indexPath.row]
        
        cell.setting = setting
        cell.delegate = self

        

        return cell
    }
    

}
