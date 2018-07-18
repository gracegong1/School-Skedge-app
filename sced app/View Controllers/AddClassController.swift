//
//  DataViewController.swift
//  sced app
//
//  Created by Gabbie on 7/16/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit

class AddClassController: UIViewController {

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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
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
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
    }
}

