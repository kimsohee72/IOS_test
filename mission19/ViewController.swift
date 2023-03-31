//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/25.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var imgView: UIImageView!
    var img =  [UIImage]()
        var num = 0
        let MAX_ARRAY_NUM = 10
        var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            pageControl.numberOfPages = 10
            pageControl.currentPage = 0
            pageControl.currentPageIndicatorTintColor = UIColor.red
            pageControl.pageIndicatorTintColor = UIColor.lightGray
            
            let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
            self.view.addGestureRecognizer(pinch)
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
                    pageControl.currentPage = num
                    imgView.image = img[num]
                    
                case UISwipeGestureRecognizer.Direction.right:
                    if num>0 {
                        num-=1
                    }
                    pageControl.currentPage = num
                    imgView.image = img[num]
                default:
                    break
                }
            }
        }
    @objc func doPinch(_ pinch:UIPinchGestureRecognizer){
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
    
}
