//
//  ShareViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/22/21.
//

import UIKit

class ShareViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func facebook(_ sender: Any) {
        if let url = NSURL(string: "http://www.facebook.com"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func instagram(_ sender: Any) {
        if let url = NSURL(string: "http://www.instagram.com"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func whatsapp(_ sender: Any) {
        if let url = NSURL(string: "http://www.whatsapp.com"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func telegram(_ sender: Any) {
        if let url = NSURL(string: "http://www.telegram.org"){
            UIApplication.shared.openURL(url as URL)
            }
    }
}
