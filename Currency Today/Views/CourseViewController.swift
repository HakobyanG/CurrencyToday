//
//  ViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit

class CourseViewController: UIViewController{


    @IBOutlet weak var timeData: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentDate()
    }
    func getCurrentDate()-> Date {
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        timeData.text = "\(nowComponents.day!).\(nowComponents.month!).\(nowComponents.year!)"
        return now as Date
    }
    @IBAction func appendButton(_ sender: Any) {
    }
    @IBAction func editButton(_ sender: Any) {
    }
    @IBAction func convertButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    @IBAction func settingsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true, completion: nil)
    }
}
