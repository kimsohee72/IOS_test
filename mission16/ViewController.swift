//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {
    
    
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        DrawFill()
    }
    
    func DrawFill() {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.orange.cgColor)
        context.addEllipse(in: CGRect(x: 120, y: 150, width: 100, height: 100))
        context.strokePath()
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addEllipse(in: CGRect(x: 120, y: 150-50, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120+50, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120-50, y: 150, width: 100, height: 100))
        context.addEllipse(in: CGRect(x: 120, y: 150+50, width: 100, height: 100))
        context.strokePath()
    
        context.setLineWidth(1.0)
        context.setStrokeColor(UIColor.green.cgColor)
        context.setFillColor(UIColor.green.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 200, y: 450))
        context.addLine(to: CGPoint(x: 140, y: 450))
        context.fillPath()
        context.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
}
