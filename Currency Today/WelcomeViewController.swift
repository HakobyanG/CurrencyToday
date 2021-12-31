//
//  WelcomeViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/6/21.
//

import UIKit
class WelcomeViewController: UIViewController {


    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var armButton: UIButton!
    @IBOutlet weak var ruButton: UIButton!
    @IBOutlet weak var engButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        layer.colors = [UIColor.white.cgColor, UIColor.systemTeal.cgColor]
        view.layer.addSublayer(layer)
        view.addSubview(label)
        view.addSubview(armButton)
        view.addSubview(ruButton)
        view.addSubview(engButton)
        // Do any additional setup after loading the view.
    }
    @IBAction func armButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func rusButton(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func engButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as! CourseViewController
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true, completion: nil)
    }
    

}
extension String {
    func localized() -> String{
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self)
    }
}
