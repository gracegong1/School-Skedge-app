//
//  SettingsViewController.swift
//  sced app
//
//  Created by Jose Domingo on 2018-07-18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Setting View Controllers
    @IBOutlet weak var daySettingsPickerView: UIPickerView!
    @IBOutlet weak var periodSettingsPickerView: UIPickerView!
    @IBOutlet weak var resetSettingsButton: UIButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        daySettingsPickerView.dataSource = self
        daySettingsPickerView.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    let daySettingsPickerData = ["1", "2", "3", "4"]
    

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return daySettingsPickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return daySettingsPickerData[row]
    }
    
}
