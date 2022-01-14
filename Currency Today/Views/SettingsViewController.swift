//
//  SettingsViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit

struct SettingsOption {
    let title: String
    let name: String
    let backgroundColor: UIColor
    let backgroundImage: UIImage
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navbarName: UINavigationItem!
    var models = [SettingsOption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        navbarName.title = "settings".localized()
    }
    
    func configure() {
        models.append(contentsOf: [
            SettingsOption(
                title: "title3".localized(), name: "connect".localized(), backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "person.text.rectangle")!){
                },
            SettingsOption(
                title: "", name: "we".localized(), backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "house.fill")!){
                },
            SettingsOption(
                title: "", name: "share".localized(), backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "doc.append.fill")!){
                },
            SettingsOption(
                title: "", name: "appInfo".localized(), backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "apps.iphone")!){
                },
            SettingsOption(
                title: "", name: "lang".localized(), backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "globe")!){
                }
        ])
    }
    
    @IBAction func courseButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as? CourseViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true, completion: nil)
    }
    
    @IBAction func convertButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ConvertViewController") as? ConvertViewController
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .overFullScreen
        self.present(vc!, animated: true, completion: nil)
    }
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models[indexPath.item].name == "connect".localized() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ConnectWithOurViewController") as! ConnectWithOurViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "we".localized() {
            let alert = UIAlertController(title: "we1".localized(), message: "Iy".localized(), preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "ok".localized(), style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if models[indexPath.item].name == "share".localized() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "appInfo".localized() {
            let alert = UIAlertController(title: "appInfo".localized(), message: "info".localized(), preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "ok".localized(), style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if models[indexPath.item].name == "lang".localized() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
