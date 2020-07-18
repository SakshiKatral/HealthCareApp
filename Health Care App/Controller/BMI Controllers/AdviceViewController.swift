//
//  AdviceViewController.swift
//  BMI Calculator App
//
//  Created by Mac on 16/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import SafariServices
import WebKit

class AdviceViewController: UIViewController, SFSafariViewControllerDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var effectURLLink : UIButton!
    @IBOutlet weak var yogaVideo1URLLink : UIButton!
    @IBOutlet weak var yogaVideo2URLLink : UIButton!
    @IBOutlet weak var exerciseVideo1URLLink : UIButton!
    @IBOutlet weak var exerciseVideo2URLLink : UIButton!
    @IBOutlet weak var dietPlanVideo1URLLink : UIButton!
    @IBOutlet weak var dietPlanVideo2URLLink : UIButton!
    
    
    var catagory = ""
    var advice : Advice?
    var adviceBrain = AdviceBrain()
    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        advice = adviceBrain.getURLLinks(catagory: catagory)
        effectURLLink.setTitle(advice?.effect, for: .normal)
        yogaVideo1URLLink.setTitle(advice?.yogaVideo[0], for: .normal)
        yogaVideo2URLLink.setTitle(advice?.yogaVideo[1], for: .normal)
        exerciseVideo1URLLink.setTitle(advice?.exerciseVideo[0], for: .normal)
        exerciseVideo2URLLink.setTitle(advice?.exerciseVideo[1], for: .normal)
        dietPlanVideo1URLLink.setTitle(advice?.dietPlanVideo[0], for: .normal)
        dietPlanVideo2URLLink.setTitle(advice?.dietPlanVideo[1], for: .normal)
        
    }
    @IBAction func hitURLPressed(_ sender: UIButton){
        url = sender.currentTitle ?? ""
        showSimpleActionSheet(url: url)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToYouTube"{
            let youTubeVC = segue.destination as? WebViewController
            youTubeVC?.string = url
        }
    }
    @IBAction func backToInformationPressed(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    //MARK: Actionsheet for videos
    func showSimpleActionSheet(url: String) {
        let temp = self.url
        let alert = UIAlertController(title: "Title", message: "Open with", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Webview", style: .default, handler: { (_) in
            self.performSegue(withIdentifier: "goToYouTube", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Safari", style: .default, handler: { (_) in
            guard let url = URL(string: temp) else {
                return
            }
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            self.present(safariVC, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { (_) in
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
