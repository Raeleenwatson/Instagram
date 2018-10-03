//
//  PhotoMapViewController.swift
//  Instagram
//
//  Created by Raeleen Watson on 9/30/18.
//  Copyright © 2018 Raeleen Watson. All rights reserved.
//

import UIKit
import Parse
import Toucan

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    
    let vc = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageView.image = originalImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        imageView.image = editedImage
        imageView.contentMode = .scaleAspectFit
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBackButton(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
    
    @IBAction func onshare(_ sender: AnyObject) {
        Post.postUserImage(image: imageView.image, withCaption: captionField.text){(success, error) in
            if success{
                print("post successful")
                self.performSegue(withIdentifier: "shareSegue", sender: nil)

            }
            else if let e = error as NSError?{
                print (e.localizedDescription)
            }
        }

    }
    
    @IBAction func galleryButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        print("tap")
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
        
    }
    

}
