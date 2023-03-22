//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit
import MapKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lblImageName: UILabel!
    let PICKER_VIEW_COLUMN = 1
    let MAX_ARRAY_NUM = 6
    let PICKER_VIEW_HEIGHT : CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFileName = ["1.png","2.png","3.png","4.png","5.png","6.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        lblImageName.text = imageFileName[0]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)->String?{
        return imageFileName[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageName.text = imageFileName[row]
        imgView.image = imageArray[row]
    }
}
