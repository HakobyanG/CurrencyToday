//
//  TestViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/21/21.
//

import UIKit

class ConnectWithOurViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func facebook(_ sender: Any) {
        if let url = NSURL(string: "http://www.facebook.com/hakobyan17.1"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func instagram(_ sender: Any) {
        if let url = NSURL(string: "http://www.instagram.com/hakobyan17.1"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func watsapp(_ sender: Any) {
        if let url = NSURL(string: "http://www.whatsapp.com"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func mail(_ sender: Any) {
        if let url = NSURL(string: "http://www.google.com/"){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func telegram(_ sender: Any) {
        if let url = NSURL(string: "http://www.telegram.org/"){
            UIApplication.shared.openURL(url as URL)
            }
    }
}
