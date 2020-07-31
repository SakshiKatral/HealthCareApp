//
//  YoutubeViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 16/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    //MARK: - Properties
    var string : String?
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - LifeCycle Methods of view
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.navigationDelegate = self
        let url = URL(string: string!)
        let request = URLRequest(url: url!)
        self.webView.load(request)
    }
    //MARK:- WKNavigationDelegate methods
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let alert = UIAlertController(title: "FAIL", message: "Unable to load url", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    //MARK: - Navigation
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
}
