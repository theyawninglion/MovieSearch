//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
    var dueDateValue: Date?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    private func popNav(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    private func updateViews(){
        guard let task = task , isViewLoaded else { return }
        
        
        nameTextField.text = task.name
        notesTextView.text = task.notes
        dateTextField.text = (task.due as Date?)?.stringValue()
        
        
    }
    @IBAction func userTappedView(_ sender: Any) {
    view.endEditing(true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
    dateTextField.text = sender.date.stringValue()
    dueDateValue = sender.date
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        tableView.reloadData()
        popNav()
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        popNav()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTextField.inputView = dueDatePicker
    }
    
}
