//
//  SettingController.swift
//  Settings2
//
//  Created by Taylor Phillips on 2/13/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit

class SettingController{
    
    static let sharedController = SettingController()
    
    //Crud - we won't need it all
    
    //update
    func updateSettingSelectionFor(setting: Setting, isOn: Bool){
        setting.isOn = isOn
    }
    //run
    var settingsArray: [Setting] = []
    init() {
        let music = Setting(iconImage: #imageLiteral(resourceName: "music"), name: "Music", isOn: false)
        let books = Setting(iconImage: #imageLiteral(resourceName: "ibooks"), name: "Books", isOn: false)
        let apps = Setting(iconImage: #imageLiteral(resourceName: "appstore"), name: "Apps", isOn: false)
        let settings = Setting(iconImage: #imageLiteral(resourceName: "ios-7-settings-icon_85154.jpg"), name: "UpDates", isOn: true)
        
        settingsArray = [music, books, apps, settings]
    }
}
