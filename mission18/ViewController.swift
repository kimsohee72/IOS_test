//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit

class ViewController: UIViewController {
    
    var img =  [UIImage]()
    var num = 0
    let MAX_ARRAY_NUM = 10
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<MAX_ARRAY_NUM{
            img.append(UIImage(named: imageFileName[i])!)
        }
        imgView.image = img[0]
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction{
            case UISwipeGestureRecognizer.Direction.left:
                if num<MAX_ARRAY_NUM-1 {
                    num+=1
                }
                imgView.image = img[num]
                
            case UISwipeGestureRecognizer.Direction.right:
                if num>0 {
                    num-=1
                }
                imgView.image = img[num]
            default:
                break
            }
        }
    }
    
  
    
    
}
