//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var selectTime: String?
    var currentTime: String?
    
    @IBOutlet var lblSelectTime: UILabel!
    @IBOutlet var lblCurrentTime: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재 시간:" + formatter.string(from: Date())
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)

    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblSelectTime.text = "선택 시간: "+formatter.string(from: datePickerView.date)
        let format = DateFormatter()
        format.dateFormat = "hh:mm aaa"
        selectTime = format.string(from: datePickerView.date)
    }
    
    @objc func updateTime(){
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재 시간:" + format.string(from: Date()) + ", " + String(count)
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm aaa"
        currentTime = formatter.string(from: Date())
        
        if (currentTime == selectTime && count == 0){
            view.backgroundColor = UIColor.red
            count+=1
        }
        if (count > 0){
            count+=1
        }
        if (count == 61){
            view.backgroundColor = UIColor.white
            count = 0
        }
        
        
    }
}

