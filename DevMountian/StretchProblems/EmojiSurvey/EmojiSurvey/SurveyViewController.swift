//
//  SurveyViewController.swift
//  EmojiSurvey
//
//  Created by Taylor Phillips on 2/23/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SurveyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var favoriteTextField: UITextField!
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        nameTextField.resignFirstResponder()
        favoriteTextField.resignFirstResponder()
        guard let name = nameTextField.text, name.characters.count > 0,
        let favoriteEmoji = favoriteTextField.text, favoriteEmoji.characters.count > 0
        else {return}
        
        SurveyController.putResponseIntoAPI(name: name, favoriteEmoji: favoriteEmoji)
        nameTextField.text = ""
        favoriteTextField.text = ""
    }
    
}
