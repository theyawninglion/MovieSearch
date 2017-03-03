//
//  Setting.swift
//  Settings
//
//  Created by Taylor Phillips on 2/6/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class Setting {
    
    let name: String
    var isSet: Bool
    let image: UIImage?
    
    init(name: String, isSet: Bool = false, image: UIImage?) {
        self.name = name
        self.isSet = isSet
        self.image = image
    }
}
