//
//  DetailVC.swift
//  Currency Today
//
//  Created by Garnik on 12/13/21.
//

import UIKit
import Charts
import Localize_Swift

class Counts {
    var count: Double
    
    init(count: Double) {
        self.count = count
    }
}

class DetailVC: UIViewController, ChartViewDelegate {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var graphikCiew: UIView!
    @IBOutlet weak var SegControlForYear: UISegmentedControl!
    @IBOutlet weak var difference: UILabel!
    @IBOutlet weak var differenceCount: UILabel!
    @IBOutlet weak var average: UILabel!
    @IBOutlet weak var averageCount: UILabel!
    @IBOutlet weak var low: UILabel!
    @IBOutlet weak var lowCount: UILabel!
    @IBOutlet weak var big: UILabel!
    @IBOutlet weak var bigCount: UILabel!
    
    var text: String = ""
    var titl: String = ""
    var cours: String = ""
    var image: UIImage?
    var date = Date()
    var dataCount: [Counts] = []
    var barChart = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChart.delegate = self
        localize()
        name.text = text
        title1.text = titl
        course.text = cours
        detailImage.image = image
        SegControlForYear.setTitle("weak".localized(), forSegmentAt: 0)
        SegControlForYear.setTitle("month".localized(), forSegmentAt: 1)
        SegControlForYear.setTitle("year".localized(), forSegmentAt: 2)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        barChart.frame = graphikCiew.frame
        barChart.center = graphikCiew.center
        view.addSubview(barChart)
        
        var entries = [BarChartDataEntry]()
        for x in 0..<15 {
            entries.append(BarChartDataEntry(x: Double(x),
                                             y: Double(x)))
        }
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.liberty()
        let data = BarChartData(dataSet: set)
        barChart.data = data
    }
    
    func localize() {
        difference.text = "difference".localized()
        low.text = "low".localized()
        average.text = "average".localized()
        big.text = "big".localized()
    }
    
    func fetchjson() {
        guard let url = URL(string: "https://open.er-api.com/v6/latest/AMD") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let safeData = data else { return }

            do {
                let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                
                self.dataCount = rezults.rates.map {
                    Counts(count: $0.value)
                }.sorted(by: {$0.count < $1.count})
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
