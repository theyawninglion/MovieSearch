//
//  NotesViewController.swift
//  Notes
//
//  Created by Taylor Phillips on 2/3/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    var notesPlaceHolder: NotesClass?
    
    @IBOutlet weak var noteTextView: UITextView!
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        clearText()
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        if let notesText = noteTextView.text{
            
            NotesController.sharedController.addNewNotes(notes: notesText)
            _ = self.navigationController?.popViewController(animated: true)
            
        }
        
        clearText()
    }
    
    func clearText(){
        noteTextView.text = ""
    }
    func updateWith(notes: NotesClass){
        noteTextView.text = notes.notesProperty
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let notes = notesPlaceHolder {
            updateWith(notes: notes)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
