//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    let imagePicker:UIImagePickerController! = UIImagePickerController()
    var captureImage : UIImage!
    var flagImageSave = false
    var numImage = 0
    
    @IBOutlet var imgView2: UIImageView!
    @IBOutlet var imgView1: UIImageView!
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func myAlert(_ title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)
        alert.addAction(action)
        self.present(alert,animated: true,completion: nil)
        self.numImage -= 1
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        if mediaType.isEqual(to: "public.image" as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave{
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            if numImage == 1{
                imgView.image = captureImage
            }
            else if numImage == 2 {
                imgView1.image = captureImage
            }
            else if numImage == 3{
                imgView2.image = captureImage
            }
        }
        
        self.dismiss(animated: true,completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        self.numImage -= 1
    }

    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker,animated: true, completion: nil)
        }
        else{
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnFormat(_ sender: UIButton) {
        numImage = 0
        imgView.image = nil
        imgView1.image = nil
        imgView2.image = nil
    }
    
    @IBAction func btnLoadImageFromCamera(_ sender: UIButton) {
        numImage += 1
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker,animated: true,completion: nil)
        }
        else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
}
