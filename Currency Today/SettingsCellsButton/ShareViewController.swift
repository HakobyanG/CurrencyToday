//
//  ShareViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/22/21.
//

import UIKit

class ShareViewController: UIViewController {
    
    var urll: String = ""
    
    @IBOutlet weak var shareApp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shareApp.text = "share".localized()
        
    }
    func touchToMedia(urlString: String) {
        urll = urlString
        if let url = NSURL(string: urlString) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    @IBAction func facebook(_ sender: Any) {
        touchToMedia(urlString: "http://www.facebook.com")
    }
    @IBAction func instagram(_ sender: Any) {
        touchToMedia(urlString: "http://www.instagram.com")
    }
    @IBAction func whatsapp(_ sender: Any) {
        touchToMedia(urlString: "http://www.whatsapp.com")
    }
    @IBAction func telegram(_ sender: Any) {
        touchToMedia(urlString: "http://www.telegram.org")
    }
}
