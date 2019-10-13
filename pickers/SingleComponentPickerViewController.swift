//
//  SingleComponentPickerViewController.swift
//  pickers
//
//  Created by Harman Dhola on 2019-10-12.
//  Copyright © 2019 Harman Dhola. All rights reserved.
//

import UIKit

class SinglecomponentpickerViewController:
UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return characterNames.count
    }
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component:Int) -> String {
        return characterNames[row]
    }
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let row = singlePicker.selectedRow(inComponent: 0)
        let selected = characterNames[row]
        let title = "you selected \(selected)!"
        
        let alert = UIAlertController (
            title: title,
            message: "thank you for choosing",
            preferredStyle: .alert)
        let action = UIAlertAction(
            title: "you are welcome",
            style: .default,
            handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var singlePicker: UIPickerView!
    private let characterNames = [
        "Luke", "leia", "han", "chewbacca", "artoo", "threepio", "lando"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
