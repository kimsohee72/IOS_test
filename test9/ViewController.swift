//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController,EditDelegate {
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    var isOn = true
    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var txtMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use Button"
        } else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar Button"
        }
        editViewController.textMessage = txtMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }
        else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    func didMessageEditDone(_ controller: EditViewController, messge: String) {
        txtMessage.text = messge
    }
    
}

