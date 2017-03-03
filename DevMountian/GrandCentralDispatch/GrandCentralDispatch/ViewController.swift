//
//  ViewController.swift
//  GrandCentralDispatch
//
//  Created by Taylor Phillips on 2/20/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func sleepButtonTapped(_ sender: Any) {
        sleepBackgroundThread()
    }
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    func sleepUI() {
        Thread.sleep(forTimeInterval: 5)
    }
    func printSyncronously() {
        for number in 1...10{
            print(number)
            
        }
        for number in 11...20 {
            print(number)
        }
    }
    func printAsyncronously(){
        let queque = DispatchQueue(label: "backgraoundSleepQueue")
        let queque2 = DispatchQueue(label: "secondBackgroundQueue")
        
        queque.async {
            for number in 1...10{
                print(number)
            }
        }
        queque2.async {
            for number in 11...20{
                print(number)
            }
        }
    }
    func sleepBackgroundThread(){
        let newBackgroundThread = DispatchQueue(label: "newBackgroundThread")
        newBackgroundThread.async {
            for number in 1...5 {
                print(number)
                Thread.sleep(forTimeInterval: 3)
            }
        }
    }
}

