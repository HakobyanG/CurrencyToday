//
//  ViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/3/21.
//

import UIKit

struct CourseOption{
    let name: String
    let currency: String
    let backgroundImage: UIImage
    let backgroundColor: UIColor
    var course: String
}
class CourseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var append: UIButton!
    @IBOutlet weak var timeData: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var models = [CourseOption]()
    var volues: [Double] = []
    var currencyCode: [String] = []
    let headerTitle = "Ներկայիս արժույթը և գրաֆիկը"
    
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
            CourseOption(name: "AMD", currency: "Դրամ", backgroundImage: UIImage(named: "arm")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "RUB", currency: "Ռուբլի", backgroundImage: UIImage(named: "rub")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "USD", currency: "Դոլլար", backgroundImage: UIImage(named: "usa")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "EURO", currency: "Եվրո", backgroundImage: UIImage(named: "euro")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "GEL", currency: "Լարի", backgroundImage: UIImage(named: "lari")!, backgroundColor: .systemTeal, course: "0"),
            CourseOption(name: "KZT", currency: "Տենգե", backgroundImage: UIImage(named: "tenge")!, backgroundColor: .systemTeal, course: "0")
        ])
    }
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
            let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
            vc?.comonInit(lab: models[indexPath.item].name, title: models[indexPath.item].currency, cours: models[indexPath.item].course, image: models[indexPath.item].backgroundImage)
            self.present(vc!, animated: true, completion: nil)
        }
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
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            models.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func fetchJson() {
        guard let url = URL(string: "https://open.er-api.com/v6/latest/AMD") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let safeData = data else { return }

            do {
                let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                self.currencyCode.append(contentsOf: rezults.rates.keys)
                self.volues.append(contentsOf: rezults.rates.values)
            }
            catch {
                print(error)
            }
        }.resume()
    }
    @IBAction func appendButton(_ sender: Any) {
        tableView.beginUpdates()
        self.models.insert(CourseOption(name: "KZT", currency: "", backgroundImage: UIImage(named: "arm")!, backgroundColor: .systemTeal, course: "0"), at: 0)
        tableView.insertRows(at: [IndexPath(row: 4, section: 0)], with: .top)
        tableView.endUpdates()
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
