//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var imgPickerView: UIImageView!
    @IBOutlet var lblImageName: UILabel!
    @IBOutlet var PickerViewlbl: UIPickerView!
    let PICKER_VIEW_COLUMN = 2
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage?]()
    var imageFIleName = [ "1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<MAX_ARRAY_NUM{
            let image = UIImage(named: imageFIleName[i])
            imageArray.append(image)
        }
        lblImageName.text = imageFIleName[0]
        imgPickerView.image = imageArray[0]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFIleName.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageFIleName[row]
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (component == 0){
            lblImageName.text = imageFIleName[row]
        }
        else{
            imgPickerView.image = imageArray[row]
        }
    }
    
}

