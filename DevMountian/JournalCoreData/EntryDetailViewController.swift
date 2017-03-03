//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by Taylor Phillips on 2/9/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var entry: Entry? {
        didSet{
            if !isViewLoaded{
                loadView()
            }
            updateViews()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: textfieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        bodyTextView.becomeFirstResponder()
        return true
    }
    
    func updateViews(){
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextView.text = entry.body
        
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = nil
        bodyTextView.text = nil
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text else { return }
        if let entry = entry {
            entry.title = title
            entry.body = bodyTextView.text
            entry.timeStamp = Date() as NSDate
        }else {
            let _ = Entry(title: title, body: bodyTextView.text)
        }
        EntryController.shared.saveToPersistentStore()
        let _ = navigationController?.popViewController(animated: true)
    }
}


