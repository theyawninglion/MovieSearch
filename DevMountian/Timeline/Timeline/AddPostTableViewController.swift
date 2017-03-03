//
//  AddPostTableViewController.swift
//  Timeline
//
//  Created by Taylor Phillips on 2/27/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController, PhotoSeletorViewControllerDelegate {
    
    //MARK: - Properties
    
    var post: Post?
    var image: UIImage?
    
    @IBOutlet weak var postCaption: UITextField!
    
    //MARK: - Conforming to Delegate
    
    func phototSelectViewControllerSelected(_ image: UIImage) {
        self.image = image
    }
    
    //MARK: - Actions
    
    func noPostAlert() {
        
        let alertController = UIAlertController(title: "Alert!", message: "You are missing either an image or caption.\nPlease make sure both are filled", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "dismiss", style: .cancel, handler: nil)
        
        alertController.addAction(dismissAction)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        self.navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addButtonTapped(_ sender: Any) {
    
        if let image = image, let postCaption = postCaption.text {
        
        PostController.sharedController.createPostWith(image: image, caption: postCaption) { (_) in
            self.dismiss(animated: true, completion: nil)
            }
        } else {
            noPostAlert()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  }
    //MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "embededPhotoSelected" {
            
            let embededViewController = segue.destination as? PhotoSeletorViewController
            embededViewController?.delegate = self
        }
    }
}
