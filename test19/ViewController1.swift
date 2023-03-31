//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    var initialFontSize : CGFloat!
    @IBOutlet var txtPinch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        if (pinch.state == UIGestureRecognizer.State.began){
            initialFontSize = txtPinch.font.pointSize
        } else{
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }
    
    
}
