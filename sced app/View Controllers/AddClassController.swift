//
//  DataViewController.swift
//  sced app
//
//  Created by Gabbie on 7/16/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit

class AddClassController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var period: Period?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    @IBOutlet weak var subjectTextField: UITextField!
    @IBOutlet weak var teacherTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet weak var orangeColorButton: UIButton!
    @IBOutlet weak var mintGreenColorButton: UIButton!
    @IBOutlet weak var skyBlueColorButton: UIButton!
    @IBOutlet weak var mutedBlueColorButton: UIButton!
    @IBOutlet weak var purpleColorButton: UIButton!
    @IBOutlet weak var addClassButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let period = period {
            subjectTextField.text = period.subject
            teacherTextField.text = period.teacher
            locationTextField.text = period.location
        } else {
            subjectTextField.text = ""
            teacherTextField.text = ""
            locationTextField.text
        }
    }
    
    let pickerData = ["Mozzarella","Gorgonzola","Provolone","Brie","Maytag Blue","Sharp Cheddar","Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]
    
    
    @IBAction func orangeColorButtonTapped(_ sender: Any) {
    }
    @IBAction func mintGreeColorButtonTapped(_ sender: Any) {
    }
    @IBAction func skyBlueColorButtonTapped(_ sender: Any) {
    }
    @IBAction func mutedBlueColorButtonTapped(_ sender: Any) {
    }
    @IBAction func purpleColorButtonTapped(_ sender: Any) {
    }
    @IBAction func addClassButtonTapped(_ sender: Any) {
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            let destination = segue.destination as? MainViewController
            else { return }
        
        switch identifier {
            
        case "confirmNewClass" where period != nil:
            period?.subject = subjectTextField.text ?? ""
            period?.teacher = teacherTextField.text ?? ""
            
          //  period?.modificationTime = Date()
            
            
            CoreDataHelper.savePeriod()
            
        case "confirmNewClass" where period == nil:
            let period = CoreDataHelper.newPeriod()
            period.subject = subjectTextField.text ?? ""
            period.teacher = teacherTextField.text ?? ""
        //    note.modificationTime = Date()
            
            CoreDataHelper.savePeriod()
        default:
            print("unidentified segue identifier")
        }
    }
}
