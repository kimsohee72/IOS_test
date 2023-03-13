//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    
    var num: Int = 1
    
    @IBOutlet var btnN: UIButton!
    @IBOutlet var btnP: UIButton!
    @IBOutlet var imgFlower: UIImageView!
    @IBOutlet var lblImage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgFlower.image = UIImage(named: "1.png")
    }
    @IBAction func btnNext(_ sender: UIButton) {
        if(num < 6){
            num+=1
            let name:String = String(num) + ".png"
            imgFlower.image = UIImage(named: name)
            lblImage.text = String(num)+"번째 이미지"
        }
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        if(num > 1){
            num-=1
            let name:String = String(num) + ".png"
            imgFlower.image = UIImage(named: name)
            lblImage.text = String(num)+"번째 이미지"
        }
    }
}

