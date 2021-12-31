//
//  ComnvertsViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/28/21.
//

import UIKit

class ComnvertsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var changeName: UILabel!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var pckerView: UIPickerView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var convertCourse: UILabel!
    
    var currencyCode: [String] = []
    var volues: [Double] = []
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
        fetchJson()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func updateViews(input: Double) {
        guard let amountText = courseTextField.text, let theAmountText = Double(amountText) else{return}
        if courseTextField.text != "" {
            let total = theAmountText * activeCurrency
            convertCourse.text = String(format: "%.2f", total)
        }
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyCode.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyCode[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = volues[row]
        updateViews(input: activeCurrency)
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
                self.currencyCode.append(contentsOf: rezults.rates.keys)
                self.volues.append(contentsOf: rezults.rates.values)
                DispatchQueue.main.async {
                    self.pckerView.reloadAllComponents()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}
