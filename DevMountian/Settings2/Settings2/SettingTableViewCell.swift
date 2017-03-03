//
//  SettingTableViewCell.swift
//  Settings2
//
//  Created by Taylor Phillips on 2/13/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit


protocol settingTableViewCellDelegate: class {
    func settingSwitchForCellValueChanged(cell: SettingTableViewCell, isOn: Bool)
}

class SettingTableViewCell: UITableViewCell {

    weak var delegate: settingTableViewCellDelegate?
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    var setting: Setting? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews() {
        guard let setting = self.setting else { return }
        iconImageView.image = setting.iconImage
        nameLabel.text = setting.name
        settingSwitch.isOn = setting.isOn
        
        
        self.backgroundColor = settingSwitch.isOn ? .purple : .white
        
//        if settingSwitch.isOn {
//            self.backgroundColor = .purple
//        }else {
//            self.backgroundColor = .white
//        }
        
    }
    
    @IBAction func settingSwitchValueChanged(_ sender: Any) {
        delegate?.settingSwitchForCellValueChanged(cell: self, isOn: settingSwitch.isOn)
        
    }

}

//Protocol



