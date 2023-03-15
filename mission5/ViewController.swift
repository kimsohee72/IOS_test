//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath:filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    func loadWebPage(_ url:String){
        let myUrl = URL(string:url)
        let myRequest = URLRequest(url:myUrl!)
        myWebView.load(myRequest)
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
         myActivityIndicator.startAnimating()
         myActivityIndicator.isHidden = false
     }
     
     func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         myActivityIndicator.stopAnimating()
         myActivityIndicator.isHidden = true
     }
     
     func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         myActivityIndicator.stopAnimating()
         myActivityIndicator.isHidden = true
     }
}

