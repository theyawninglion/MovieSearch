//
//  Settings.swift
//  Settings2
//
//  Created by Taylor Phillips on 2/13/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit

class Setting {
    var iconImage: UIImage?
    let name: String
    var isOn: Bool
    
    init(iconImage: UIImage? = nil, name: String, isOn: Bool = false) {
        self.isOn = isOn
        self.name = name
        self.iconImage = iconImage
    }
}
