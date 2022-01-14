//
//  ViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit
import Localize_Swift

class CourseOption {
    var name: String
    var currency: String
    var backgroundImage: UIImage
    var backgroundColor: UIColor
    var course: String
    
    init(name: String, currency: String, backgroundImage: UIImage,backgroundColor: UIColor, course: String) {
        self.name = name
        self.currency = currency
        self.backgroundImage = backgroundImage
        self.backgroundColor = backgroundColor
        self.course = course
    }
}

class CourseViewController: UIViewController {
    
    @IBOutlet weak var append: UIButton!
    @IBOutlet weak var timeData: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var models = [CourseOption]()
    var volues: [Double] = []
    var currencyCode: [String] = []
    let headerTitle = "title".localized()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsMultipleSelectionDuringEditing = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        getCurrentDate()
        configure()
        fetchJson()
    }
    
    func configure() {
        models.append(contentsOf: [
            CourseOption(name: "AMD", currency: "dram".localized(), backgroundImage: UIImage(named: "arm")!, backgroundColor: .systemTeal, course: "1"),
            CourseOption(name: "RUB", currency: "rubli".localized(), backgroundImage: UIImage(named: "rub")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "USD", currency: "dollar".localized(), backgroundImage: UIImage(named: "usa")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "EUR", currency: "euro".localized(), backgroundImage: UIImage(named: "euro")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "GEL", currency: "lari".localized(), backgroundImage: UIImage(named: "lari")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "KZT", currency: "tenge".localized(), backgroundImage: UIImage(named: "tenge")!, backgroundColor: .systemTeal, course: "0")
        ])
    }
    
    func getCurrentDate(){
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        timeData.text = "\(nowComponents.day!).\(nowComponents.month!).\(nowComponents.year!)"
    }
    
    func fetchJson() {
        guard let url = URL(string: "https://open.er-api.com/v6/latest/AMD") else { return }
        URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let safeData = data else { return }
            
            do {
                let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                self.currencyCode.append(contentsOf: rezults.rates.keys)
                self.volues.append(contentsOf: rezults.rates.values)
                rezults.rates.forEach {(key, value) in
                    self.models = self.models.map {
                        if $0.name == key {
                            let courseKey = (Double(models[0].course) ?? 0)/value
                            $0.course = "\(Double(round(100 * courseKey) / 100))"
                        }
                        return $0
                    }
                }
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
            catch {
                print(error)
            }
        }.resume()
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
extension CourseViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = headerTitle
        return section
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models[indexPath.item].name != ""{
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
            let model = models[indexPath.item]
            vc.text = model.name
            vc.titl = model.currency
            vc.cours = model.course
            vc.image = model.backgroundImage
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
