//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Taylor Phillips on 2/6/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var settingImageView: UIImageView!
    @IBOutlet weak var settingNameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    weak var delegate: SettingTableViewCellDelegate?
    
    var setting: Setting? {
        didSet {
            guard let setting = setting else { return }
            settingNameLabel.text = setting.name
            settingImageView.image = setting.image
            settingSwitch.isOn = setting.isSet
            backgroundColor = setting.isSet ? .green : .white
        }
    }
    
    @IBAction func settingSwitchToggled(_ sender: UISwitch) {
        delegate?.settingValueChanged(self, seleced: sender.isOn)
    }
  
}
protocol SettingTableViewCellDelegate: class {
    func settingValueChanged(_ cell: SettingTableViewCell, seleced: Bool)
}
