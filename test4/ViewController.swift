//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    var isLampOn = true
    var isLampRemove = false
    let imgOn = UIImage(named: "lamp-on.png")
    let imgOff = UIImage(named: "lamp-off.png")
    let imgRemove = UIImage(named: "lamp-remove.png")
    @IBOutlet var imgLamp: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgLamp.image=imgOn
    }
    
    @IBAction func btnRemove(_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "램프 제거", message: "램프를 제거하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let offAction = UIAlertAction(title: "아니요, 끕니다(Off)", style:  UIAlertAction.Style.default,handler: { ACTION in self.imgLamp.image = self.imgOff
            self.isLampOn=false
            self.isLampRemove = false
        })
        let onAction = UIAlertAction(title: "아니요, 켭니다(On)", style:  UIAlertAction.Style.default,handler: { ACTION in self.imgLamp.image = self.imgOn
            self.isLampOn=true
            self.isLampRemove = false
        })
        let removeAction = UIAlertAction(title: "네, 제거합니다", style:  UIAlertAction.Style.default,handler: { ACTION in self.imgLamp.image = self.imgRemove
            self.isLampRemove = true
        })
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert,animated: true,completion: nil)
    }
    @IBAction func btnOn(_ sender: UIButton) {
        if ((!isLampOn) && (!isLampRemove)){
            imgLamp.image=imgOn
            isLampOn=true
        }
        else if (!isLampRemove){
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다", style:  UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
        }
        else{
            let lampOnAlert = UIAlertController(title: "경고", message: "전구가 제거되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다", style:  UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
        }
    }
    @IBAction func btnOff(_ sender: UIButton) {
        if ((isLampOn) && (!isLampRemove)){
            let lampOffAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let offAction = UIAlertAction(title: "네", style:  UIAlertAction.Style.default,handler: { ACTION in self.imgLamp.image = self.imgOff
                self.isLampOn=false
            })
            let cancelAction = UIAlertAction(title: "아니요", style:  UIAlertAction.Style.default,handler: nil)
            lampOffAlert.addAction(offAction)
            lampOffAlert.addAction(cancelAction)
            present(lampOffAlert,animated: true,completion: nil)
        }
        else if (!isLampRemove){
            imgLamp.image = self.imgOff
            isLampOn=false
        }
        else{
            let lampOnAlert = UIAlertController(title: "경고", message: "전구가 제거되었습니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네 알겠습니다", style:  UIAlertAction.Style.default,handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert,animated: true,completion: nil)
            isLampOn=false
        }
    }
}

