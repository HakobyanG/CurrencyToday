//
//  ComnvertsViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/28/21.
//

import UIKit
class Converts {
    var name: String
    var count: Double
     
    init(name: String, count: Double) {
        self.name = name
        self.count = count
    }
}
class ComnvertsViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var changeName: UILabel!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var pckerView: UIPickerView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var convertCourse: UILabel!
    
    var dataSource: [Converts] = []
    var activeCurrency = 0.0
    var ap: String = ""
    var text: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseTextField.delegate = self
        pckerView.delegate = self
        pckerView.dataSource = self
        courseTextField.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        name.text = text
        changeName.text = "changeName".localized()
        label1.text = "money".localized()
        fetchJson()
    }
    
    @objc func updateViews(input: Double) {
        guard let amountText = courseTextField.text, let theAmountText = Double(amountText) else{return}
        if courseTextField.text != "" {
            let total = theAmountText * activeCurrency
            convertCourse.text = String(format: "%.2f", total)
        }
    }
    
    func fetchJson() {
        guard let url = URL(string: ap) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            guard let safeData = data else { return }

            do {
                let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
            
                self.dataSource = rezults.rates.map {
                    Converts(name: $0.key, count: $0.value)
                }.sorted(by: {$0.name < $1.name})
                DispatchQueue.main.async {
                    self.pckerView.reloadAllComponents()
                    self.activeCurrency = self.dataSource[0].count
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
extension ComnvertsViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row].name
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = dataSource[row].count
        updateViews(input: activeCurrency)
    }
}
