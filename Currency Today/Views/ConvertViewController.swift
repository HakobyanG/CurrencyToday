//
//  ConvertViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit
struct ConvertsOption {
    let title: String
    let name: String
    let backgroundColor: UIColor
    let backgroundImage: UIImage
}
class ConvertViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var stack: UIStackView!
    var models = [ConvertsOption]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ConvertsTableViewCell.self, forCellReuseIdentifier: ConvertsTableViewCell.identifier)
        configure()
    }
    func configure() {
        models.append(contentsOf: [
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "AMD", backgroundColor: .white, backgroundImage: UIImage(named: "arm")!),
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "RUB", backgroundColor: .white, backgroundImage: UIImage(named: "rub")!),
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "USD", backgroundColor: .white, backgroundImage: UIImage(named: "usa")!),
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "EURO", backgroundColor: .white, backgroundImage: UIImage(named: "euro")!),
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "GEL", backgroundColor: .white, backgroundImage: UIImage(named: "lari")!),
            ConvertsOption(title: "Ընտրեք ձեր գումարի տարադրամը", name: "KZT", backgroundColor: .white, backgroundImage: UIImage(named: "tenge")!)
        ])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConvertsTableViewCell.identifier, for: indexPath) as? ConvertsTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models[indexPath.item].name == "AMD" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "AmdViewController") as! AmdViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "RUB" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "RusViewController") as! RusViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "USD" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "UsdViewController") as! UsdViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "EURO" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "EuroViewController") as! EuroViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "KZT" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "KztViewController") as! KztViewController
            self.present(vc, animated: true, completion: nil)
        }else if models[indexPath.item].name == "GEL" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "GelViewController") as! GelViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func courseButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CourseViewController") as? CourseViewController
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
