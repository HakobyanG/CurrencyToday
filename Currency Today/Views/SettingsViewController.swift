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
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var models = [SettingsOption]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
    }
    func configure() {
        models.append(contentsOf: [
            SettingsOption(
                title: "Հավելված", name: "Կապ մեզ հետ", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "person.text.rectangle")!){
                },
            SettingsOption(
                title: "", name: "Մեր մասին", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "house.fill")!){
                },
            SettingsOption(
                title: "", name: "Կիսվել Հավելվածով", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "doc.append.fill")!){
                },
            SettingsOption(
                title: "", name: "Հավելվածի մասին", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "apps.iphone")!){
                },
            SettingsOption(
                title: "", name: "Լեզու", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "globe")!){
                }
        ])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
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
        if models[indexPath.item].name == "Կապ մեզ հետ" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ConnectWithOurViewController") as! ConnectWithOurViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "Մեր մասին" {
            let alert = UIAlertController(title: "Ծրագիրը կազմել են", message: "Գառնիկ Հակոբյանը և Օնիկ Մկրտչյանը", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Լավ", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if models[indexPath.item].name == "Կիսվել Հավելվածով" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "Հավելվածի մասին" {
            let alert = UIAlertController(title: "Հավելվածի մասին", message: "Ծրագիրը նախատեսված է օրվա ցանկացած ժամին արժույթի մասին տեղեկություն ստանալու,նրանց աճի և նվազման գրաֆիկը տեսնելու, ձեր ունեցած գումարի արտարժույթը իմանալու համար,այն հասանելի է ցանկացած երկրում ցանկացած արժույթով", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Լավ", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if models[indexPath.item].name == "Լեզու" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
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
