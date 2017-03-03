//
//  AlernativeFactViewController.swift
//  AltetnativeFacts
//
//  Created by Taylor Phillips on 3/2/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import CloudKit

class AlernativeFactViewController: UIViewController {
    @IBOutlet weak var alternativeFactTextField: UITextField!

    @IBAction func submitButtonTapped(_ sender: Any) {
        
        guard let fact = alternativeFactTextField.text else { return }
        AlternativeFactController.sendAlternativeFactToCloudKit(alternativeFactString: fact)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
