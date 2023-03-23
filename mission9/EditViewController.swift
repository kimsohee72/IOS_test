//
//  EditViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/23.
//

import UIKit

protocol EditDelegate{
    func didMessageEditDone(_ controller: EditViewController, messge: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageResizeDone(_ controller: EditViewController, resize: Bool)
}

class EditViewController: UIViewController {
    @IBOutlet var swIsOn: UISwitch!
    var isOn = false
    
    @IBOutlet var btnResize: UIButton!
    @IBOutlet var txtMessage: UITextField!
    var delegate: EditDelegate?
    var textWayValue: String = ""
    var textMessage: String = ""
    var resize = true

    @IBOutlet var lblWay: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txtMessage.text = textMessage
        swIsOn.isOn = isOn
        if resize{
            btnResize.setTitle("축소", for: .normal)
        }
        else{
            btnResize.setTitle("확대", for: .normal)
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnResizeImage(_ sender: UIButton) {
        if resize {
            resize = false
            btnResize.setTitle("확대", for: .normal)
        }
        else{
            resize = true
            btnResize.setTitle("축소", for: .normal)
        }
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn=true
        } else {
            isOn=false
        }
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, messge: txtMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageResizeDone(self, resize: resize)
        }
        _ = navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
