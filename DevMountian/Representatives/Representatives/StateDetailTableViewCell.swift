//
//  StateDetailTableViewCell.swift
//  Representatives
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import Foundation
class StateDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var districtLabel: UILabel!
    
    @IBAction func districtButtonTapped(_ sender: Any) {
    }
    @IBAction func phoneButtonTapped(_ sender: Any) {
    }
    @IBAction func urlButtonTapped(_ sender: Any) {
        guard let representative = representative else {return}
        if let url = NSURL(string: representative.link) as? URL{
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.canOpenURL(url)
                print("weblink works")
            }else{ print("can't open website still")}
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        urlButton.addTarget(self, action: Selector(("urlButtonTapped")), for: .touchUpInside)
        representative = nil
    }
    
    var representative: Representative?{
        didSet{
            updateViews()
        }
    }
    private func updateViews(){
        guard let representative = representative else {return}
        
        nameLabel.text = representative.name
        partyLabel.text = representative.party
        let urlTitle = representative.link
        urlButton.setTitle(urlTitle, for: .normal)
        let phonetitle = representative.phone
        phoneButton.setTitle(phonetitle, for: .normal)
        districtLabel.text = representative.district
    }
    
}
