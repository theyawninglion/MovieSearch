//
//  TaskDetailTableViewController.swift
//  TaskCoreData
//
//  Created by Taylor Phillips on 2/15/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dueTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func userTappedView(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        dueTextField.text = sender.date.stringValue()
        dueDateValue = sender.date
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
    let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let notes = notesTextView.text else {return}
        
        
        if let task = task {
            
            TaskController.sharedController.update(task: task, name: name, notes: notes, due: dueDateValue)
            
        }else{
            
            TaskController.sharedController.add(taskWithName: name, notes: notes, due: dueDateValue)
        }
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dueTextField.inputView = datePicker
        updateViews()
    }

    var task: Task?{
        didSet{
            updateViews()
        }
    }
    var dueDateValue: Date?
    
    private func updateViews(){
        guard let task = task, isViewLoaded else {return}
        nameTextField.text = task.name
        notesTextView.text = task.notes
        dueTextField.text = (task.due as Date?)?.stringValue()
        
        
        
        self.title = task.name
    }
    
    
}
