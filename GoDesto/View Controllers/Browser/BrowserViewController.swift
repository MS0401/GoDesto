//
//  BrowserViewController.swift
//  GoDesto
//
//  Created by Ghafar Tanveer on 22/03/2018.
//  Copyright © 2018 Ghafar Tanveer. All rights reserved.
//

import UIKit

class BrowserViewController: BaseViewController {
    
    @IBOutlet weak var btnMenu:UIButton?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var webView:UIWebView?
    

    var url:String = "https://www.google.com/"
    var browerInfo = [String:String]()
    var isLoading:Bool?  = false
    override func viewDidLoad() {
        super.viewDidLoad()

        GCD.async(.Main, execute: {
            if let container = self.mainContainer{
                container.startActivity()
            }
        })
        
        self.webView?.loadRequest(URLRequest(url: URL(string: browerInfo["url"]!)!))
        self.webView?.delegate = self
        self.lblTitle?.text = browerInfo["title"]
        self.addSideMenu(button: self.btnMenu!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
extension BrowserViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {

        GCD.async(.Main){
            if let container = self.mainContainer{
                container.stopActivity()
            }
        }
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
        GCD.async(.Main){
            if let container = self.mainContainer{
                container.stopActivity()
            }
        }
        
    }
}
