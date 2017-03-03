//
//  PhotoSeletorViewController.swift
//  Timeline
//
//  Created by Taylor Phillips on 3/1/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PhotoSeletorViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Properties
    
    weak var delegate: PhotoSeletorViewControllerDelegate?
    
    @IBOutlet weak var SelectImageButton: UIButton!
    @IBOutlet weak var selectImageView: UIImageView!
    
    var selectedImage: UIImage = UIImage()
    
    //MARK: - Actions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { (_) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
            
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        let savedPhotosAction = UIAlertAction(title: "Saved Photos", style: .default) { (_) in
            imagePicker.sourceType = .savedPhotosAlbum
            self.present(imagePicker, animated: true, completion: nil)
        }
        actionSheet.addAction(cancelAction)
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            actionSheet.addAction(cameraAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            actionSheet.addAction(photoLibraryAction)
        }
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            actionSheet.addAction(savedPhotosAction)
        }
        present(actionSheet, animated: true, completion: nil)
        
    }
    //MARK: - UIImagePickerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else { return }
        
        selectImageView.image = image
        SelectImageButton.setTitle("", for: .normal)
        delegate?.phototSelectViewControllerSelected(image)
    
    }
}

//MARK: - Protocol

protocol PhotoSeletorViewControllerDelegate: class {
    func phototSelectViewControllerSelected(_ image: UIImage)
}
