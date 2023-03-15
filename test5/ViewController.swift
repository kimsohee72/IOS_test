//
//  ViewController.swift
//  TestIOS
//
//  Created by 김소희 on 2023/03/13.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://2sam.net")
       
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
    
    func loadWebPage(_ url:String){
        let myUrl = URL(string:url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    func checkUrl(_ url:String)->String{
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    @IBAction func btnFastForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    @IBAction func btnRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath : filePath!)
        let myRequest = URLRequest(url:myUrl)
        myWebView.load(myRequest)
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML String </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://2sam.net\">2sam</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnGotoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnGotoSite1(_ sender: UIButton) {
        loadWebPage("http://fallinmac.tistory.com")
    }
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
}

