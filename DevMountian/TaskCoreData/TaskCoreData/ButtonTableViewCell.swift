//
//  ButtonTableViewCell.swift
//  TaskCoreData
//
//  Created by Taylor Phillips on 2/15/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?
    
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    var task: Task?{
        didSet{
            updateViews()
        }
    }
    func updateViews(){
        guard let task = task else{return primaryLabel.text = ""}
        primaryLabel.text = task.name
        let image = task.isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        completeButton.setImage(image, for: .normal)
    }
}
protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
