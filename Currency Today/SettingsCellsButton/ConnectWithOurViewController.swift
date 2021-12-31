//
//  TestViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/21/21.
//

import UIKit

class ConnectWithOurViewController: UIViewController {
    var urll: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func touchToMedia(urlString: String) {
        urll = urlString
        if let url = NSURL(string: urll){
            UIApplication.shared.openURL(url as URL)
            }
    }
    @IBAction func facebook(_ sender: Any) {
        touchToMedia(urlString: "http://www.facebook.com/hakobyan17.1")
    }
    @IBAction func instagram(_ sender: Any) {
        touchToMedia(urlString: "http://www.instagram.com/hakobyan17.1")
    }
    @IBAction func watsapp(_ sender: Any) {
        touchToMedia(urlString: "http://www.whatsapp.com")
    }
    @IBAction func mail(_ sender: Any) {
        touchToMedia(urlString: "http://www.google.com/")
        
    }
    @IBAction func telegram(_ sender: Any) {
        touchToMedia(urlString: "http://www.telegram.org/")
    }
}
