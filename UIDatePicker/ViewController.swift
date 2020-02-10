//
//  ViewController.swift
//  UIDatePicker
//
//  Created by Sridatta Nallamilli on 27/12/19.
//  Copyright © 2019 Sridatta Nallamilli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentTF = UITextField()
    var pickerView = UIPickerView()
    
    @IBOutlet weak var dateField: UITextField!
    
    @IBOutlet weak var districtsTextfield: UITextField!
    
    @IBOutlet weak var numbersTextfield: UITextField!
    
    
    let districtsArr = ["Anantapur", "Chittoor", "East Godavari", "Guntur", "Kadapa", "Krishna", "Kurnool", "Nellore", "Prakasam", "Srikakulam", "Visakhapatnam", "Vizianagaram", "West Godavari"]
    
    let numbersArr = ["1","2","3","4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dateField.delegate = self
        
        
    }

}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
        
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        currentTF = textField
        if currentTF == districtsTextfield {
            districtsTextfield.inputView = pickerView
        }
        else if currentTF == numbersTextfield {
            numbersTextfield.inputView = pickerView
        }
        
    }
}

extension ViewController {
    
    func openDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerValueChangedHandler(datePicker:)), for: .valueChanged)
        dateField.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtn))
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneBtn))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([cancelBtn, flexibleBtn, doneBtn], animated: false)
        
        dateField.inputAccessoryView = toolbar
        
    }
    
    @objc func cancelBtn() {
        dateField.resignFirstResponder()
    }
    
    @objc func doneBtn() {
        
        dateField.resignFirstResponder()
    }
    
    @objc func datePickerValueChangedHandler(datePicker: UIDatePicker) {
        if let datePicker = dateField.inputView as? UIDatePicker {
            
            let dateFormat = DateFormatter()
            dateFormat.dateStyle = .medium
            dateField.text = dateFormat.string(from: datePicker.date)
        
            print(datePicker.date)
        }
        print(datePicker.date)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return districtsArr.count
        
        if currentTF == districtsTextfield {
            return districtsArr.count
        }
        else if currentTF == numbersTextfield {
            return numbersArr.count
        }
        else {
            return 0
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return districtsArr[row]
        
        if currentTF == districtsTextfield {
            return districtsArr[row]
        }
        else if currentTF == numbersTextfield {
            return numbersArr[row]
        }
        else {
            return ""
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        districtsTextfield.text = districtsArr[row]
        
        if currentTF == districtsTextfield {
            districtsTextfield.text = districtsArr[row]
        }
        else if currentTF == numbersTextfield {
            numbersTextfield.text = numbersArr[row]
        }
        
    }
    
    
}



