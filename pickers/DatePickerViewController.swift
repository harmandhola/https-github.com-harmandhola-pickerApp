//
//  DatePickerViewController.swift
//  pickers
//
//  Created by Harman Dhola on 2019-10-12.
//  Copyright © 2019 Harman Dhola. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = NSDate()
        datePicker.setDate(date as Date, animated: false)

    }
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let date = datePicker.date
        let message = "the date and time you selected is \(date)"
        let alert = UIAlertController(
            title: "date and time selected",
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "thats so true!",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
