//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imageView: UIImageView!
    var size = true
    var lamp_on : UIImage?
    var lamp_off : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lamp_on = UIImage(named: "lamp-on.png")
        lamp_off  = UIImage(named: "lamp-off.png")
        imageView.image = lamp_on
    }
   
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale: CGFloat = 1.5
        var newWidth : CGFloat, newHeight : CGFloat
        if size {
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        else {
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        size = !size
    }
    @IBAction func switchOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imageView.image=lamp_on
        }
        else{
            imageView.image = lamp_off
        }
    }
    
}

