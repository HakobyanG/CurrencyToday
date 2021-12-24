//
//  KztViewController.swift
//  Currency Today
//
//  Created by Garnik on 12/24/21.
//

import UIKit

class KztViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var label2: UILabel!
    
    var currencyCode: [String] = []
    var volues: [Double] = []
    var activeCurrency = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        layer.colors = [UIColor.white.cgColor, UIColor.systemTeal.cgColor]
        view.layer.addSublayer(layer)
        view.addSubview(label)
        view.addSubview(name)
        view.addSubview(textField)
        view.addSubview(pickerView)
        view.addSubview(label2)
        view.addSubview(nameLabel)
        fetchJson()
        textField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        textField.addTarget(self, action: #selector(updateViews), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @objc func updateViews(input: Double) {
        guard let amountText = textField.text, let theAmountText = Double(amountText) else{return}
        if textField.text != "" {
            let total = theAmountText * activeCurrency
            label.text = String(format: "%.2f", total)
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
        guard let url = URL(string: "https://open.er-api.com/v6/latest/KZT") else{ return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            guard let safeData = data else{return}
            
            do{
                let rezults = try JSONDecoder().decode(ExchangeRates.self, from: safeData)
                self.currencyCode.append(contentsOf: rezults.rates.keys)
                self.volues.append(contentsOf: rezults.rates.values)
                DispatchQueue.main.async {
                    self.pickerView.reloadAllComponents()
                }
            }
            catch {
                print(error)
            }
        }.resume()
    }
}

