//
//  SettingController.swift
//  Settings
//
//  Created by Taylor Phillips on 2/6/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SettingController {
    
    static let sharedController = SettingController()
    let mySettings: [Setting]
    
    init() {
        let apps = Setting(name: "Apps", isSet: false, image: #imageLiteral(resourceName: "appstore"))
        let books = Setting(name: "Books", isSet: false, image: #imageLiteral(resourceName: "ibooks"))
        let music = Setting(name: "Music", isSet: false, image: #imageLiteral(resourceName: "music"))
        let updates = Setting(name: "Updates", isSet: false, image: #imageLiteral(resourceName: "appstore"))
        let zoteri = Setting(name: "Zoteri", isSet: false, image: #imageLiteral(resourceName: "zoteri"))
        
        mySettings = [apps, books, music, updates, zoteri]
    }
}
