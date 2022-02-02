//
//  WelcomeViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/6/21.
//

import UIKit
import Localize_Swift
class WelcomeViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var armButton: UIButton!
    @IBOutlet weak var ruButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var engButton: UIButton!
    
    var selectedLanguage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func buttonAction(_ sender: UIButton) {
        let index = sender.tag
        switch index {
        case 1:
            Localize.setCurrentLanguage("hy")
        case 2:
            Localize.setCurrentLanguage("ru")
        case 3:
            Localize.setCurrentLanguage("en")
        default:
            print("Error")
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
