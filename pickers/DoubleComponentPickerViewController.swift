//
//  DoubleComponentPickerViewController.swift
//  pickers
//
//  Created by Harman Dhola on 2019-10-12.
//  Copyright © 2019 Harman Dhola. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == breadComponent {
            return breadTypes.count
        }else {
            return fillingTypes.count
        }    }
    func pickerView(_pickerView:UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        if component == breadComponent {
            return breadTypes[row]
            
        }else {
            return fillingTypes[row]
        }
    }

    @IBOutlet weak var doublePicker: UIPickerView!
    private let fillingComponent = 0
    private let breadComponent = 1
    private let fillingTypes = ["ham", "turkey", "peanut butter" , "tuna salad", "chicken salad", "roast beef", "vegemite"]
    private let breadTypes = ["white", "whole wheat", "rye" ,"seven grain", "sourdough"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
    
        let fillingRow = doublePicker.selectedRow(inComponent: fillingComponent)
        let breadRow = doublePicker.selectedRow(inComponent: breadComponent)
        let filling = fillingTypes[fillingRow]
        let bread = breadTypes[breadRow]
        let message = "your \(filling) on \(bread) bread will be right up"
        
        let alert = UIAlertController(
            title: "thank you for your order",
            message: message,
            preferredStyle: .alert
        )
        let action = UIAlertAction(
            title: "great",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)

}
}
