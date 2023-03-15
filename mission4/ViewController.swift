//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var pickerDate: UIDatePicker!
    @IBOutlet var lblSelectTime: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    var CurrentTime : String?
    var SelectTime : String?
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = formatter.string(from: Date())
        lblSelectTime.text = formatter.string(from: Date())
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectTime.text = formatter.string(from: datePickerView.date)
        SelectTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = format.string(from: Date()) + ", " + String(count)
        CurrentTime = format.string(from: Date())
        if(SelectTime == CurrentTime){
            if(count == 0){
                let TimeAlert = UIAlertController(title: "알림", message: "설정된 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let countTime = UIAlertAction(title: "네, 알겠습니다.", style:  UIAlertAction.Style.default,handler: { ACTION in self.count += 1
                        })
                TimeAlert.addAction(countTime)
                present(TimeAlert,animated: true,completion: nil)
            }
        }
        if(count>0){
            count += 1
        }
        if(count>60){
            count = 0
        }
    }
    
}

