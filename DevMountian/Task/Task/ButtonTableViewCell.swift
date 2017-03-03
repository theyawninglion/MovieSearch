//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ButtonTableViewCell: UITableViewCell{
    
    @IBOutlet weak var complete: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: Any) {
        
        
    }
    
    func updateButton(_ isComplete: Bool){
        if isComplete == true{
            complete.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
        } else{
            complete.setImage(#imageLiteral(resourceName: "incomplete.png"), for: .normal)
        }
    }
    
    
    
    extension ButtonTableViewCell{
        func update(withTask task: Task){
                
                primaryLabel.text = task.name
                updateButton(task.isComplete)
                
            
        }
    }
}
