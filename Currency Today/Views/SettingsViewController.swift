//
//  SettingsViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit

//struct Section {
//    let title: String
//    let options: [SettingsOption]
//}
struct SettingsOption {
    let title: String
    let name: String
    let backgroundColor: UIColor
    let backgroundImage: UIImage
    let handler: (() -> Void)
}
class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
//    var models = [Section]()
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
                title: "", name: "Ծանուցումներ", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "message.and.waveform")!){
                },
            SettingsOption(
                title: "", name: "Կիսվել Հավելվածով", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "doc.append.fill")!){
                },
            SettingsOption(
                title: "", name: "Հավելվածի մասին", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "apps.iphone")!){
                },
            SettingsOption(
                title: "", name: "Լեզու", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "globe")!){
                },
        ])
//        models.append(Section(title: "Կապ", options: [
//            SettingsOption(name: "Կապ մեզ հետ", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "person.text.rectangle")!){
//            },
//            SettingsOption(name: "Մեր մասին", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "house.fill")!) {
//            },
//        ]))
//        models.append(Section(title: "Հավելված", options: [
//            SettingsOption(name: "Ծանուցումներ", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "message.and.waveform")!) {
//            },
//            SettingsOption(name: "Կիսվել Հավելվածով", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "doc.append.fill")!) {
//            },
//            SettingsOption(name: "Հավելվածի մասին", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "apps.iphone")!) {
//            },
//            SettingsOption(name: "Լեզու", backgroundColor: .systemTeal, backgroundImage: UIImage(systemName: "globe")!) {
//            }
//        ]))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return models[section].options.count
        return models.count
    }
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return models.count
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let model = models[indexPath.section].options[indexPath.row]
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.present(vc, animated: true, completion: nil)
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
