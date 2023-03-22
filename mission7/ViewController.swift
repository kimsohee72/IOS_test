//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    var number = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        lblNumber.text = String(number)
    }
   
    @IBAction func changeNumber(_ sender: UIPageControl) {
        lblNumber.text = String(pageControl.currentPage+1)
    }
    
}

