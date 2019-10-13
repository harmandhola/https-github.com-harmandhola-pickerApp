//
//  DependentComponentPickerViewController.swift
//  pickers
//
//  Created by Harman Dhola on 2019-10-12.
//  Copyright © 2019 Harman Dhola. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String: [String]]!
    private var states:[String]!
    private var zips:[String]!
    
     @IBOutlet weak var dependentPicker: UIPickerView!
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let stateRow = dependentPicker.selectedRow(inComponent: stateComponent)
        let zipRow = dependentPicker.selectedRow(inComponent: zipComponent)
        let state = states[stateRow]
        let zip = zips[zipRow]
        let title = "you selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        let alert = UIAlertController(
            title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(
            title: "ok", style: .default, handler: nil )
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent{
            return states.count
            
        }else {
            return zips.count
        }
    }
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int ) -> String{
        if component == stateComponent {
            return states[row]
            
        }else {
            return zips[row]
            
        }
    }
    func pickerView(_pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent{
            let selectedState = states[row]
            zips = stateZips[selectedState]!
            dependentPicker.reloadComponent(zipComponent)
            dependentPicker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let bundle = Bundle.main
        let plistURL = bundle.url(forResource: "statedictionary", withExtension: "plist")
        stateZips = NSDictionary.init(contentsOf: (plistURL!)) as! [String : [String]]
        let allStates = stateZips.keys
        states = allStates.sorted()
        let selectedState = states[0]
        zips = stateZips[selectedState]


    }
    

}
