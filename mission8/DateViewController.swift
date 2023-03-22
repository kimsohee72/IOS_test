//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit
import MapKit

class DateViewController: UIViewController {
    var CurrentTime : String?
    var SelectTime : String?
    let timeSelector:Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    @IBOutlet var lblSelecttime: UILabel!
    @IBOutlet var lblCurrenttime: UILabel!
    @IBOutlet var pickerDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrenttime.text = "현재 시간: " + formatter.string(from: Date())
        lblSelecttime.text = "선택 시간: " + formatter.string(from: Date())
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
   
    @IBAction func DatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelecttime.text = "선택 시간: "+formatter.string(from: datePickerView.date)
        SelectTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrenttime.text = "현재 시간: " + formatter.string(from: Date()) + ", 타이머: " + String(count)
        CurrentTime = formatter.string(from: Date())
        if CurrentTime == SelectTime{
            if count == 0{
                let TimeAlert = UIAlertController (title: "알림", message: "설정된 시간입니다!!", preferredStyle: UIAlertController.Style.alert)
                let countTime = UIAlertAction(title: "네 알겠습니다", style: UIAlertAction.Style.default, handler: {ACTION in self.count += 1
                })
                TimeAlert.addAction(countTime)
                present(TimeAlert,animated: true,completion: nil)
            }
        }
        if count>0 {
            count += 1
            view.backgroundColor = UIColor.red
        }
        if count > 10{
            count = 0
            view.backgroundColor = UIColor.white
        }
    }
    
}

