//
//  AddViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/23.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pickImage: UIPickerView!
    @IBOutlet var tfAddItem: UITextField!
    let PICKER_VIEW_COLUMN = 1
    let PICKER_VIEW_HEIGHT:CGFloat = 80
    let MAX_ARRAY_NUM = 3
    var image = itemsImageFile[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = UIImage(named:itemsImageFile[0])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(image)
        tfAddItem.text = ""
        _ = navigationController?.popViewController(animated: true)
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemsImageFile.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: UIImage(named: itemsImageFile[row]))
        imageView.frame = CGRect(x: 0, y: 0, width: 50  , height: 50)
        return imageView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = UIImage(named: itemsImageFile[row])
        image = itemsImageFile[row]
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
