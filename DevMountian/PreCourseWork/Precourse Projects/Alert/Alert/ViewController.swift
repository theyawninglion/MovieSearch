//
//  ViewController.swift
//  Alert
//
//  Created by Taylor Phillips on 2/6/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let alertController = UIAlertController(title: "Alert", message: "this is an alert", preferredStyle: UIAlertControllerStyle.alert)
        
        let destructiveAction = UIAlertAction(title: "Warning", style: .destructive) { alert -> Void in
            print("Something blew up.")
        }
        
        
        let defaultAction = UIAlertAction(title: "cancel", style: .default) { alert -> Void in
            print("Boring")
        }
        let okAction = UIAlertAction(title: "ok", style: .default) { alert -> Void in
            print("ok")
            
        }
        
        alertController.addAction(destructiveAction)
        alertController.addAction(defaultAction)
        alertController.addAction(okAction)
        
        
        
    }
    
    
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
        
}
