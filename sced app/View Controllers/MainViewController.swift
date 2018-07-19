//
//  MainViewController.swift
//  sced app
//
//  Created by Grace Gong on 7/17/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var periodTableView: UITableView!
    
    var periods = [Period]() {
    didSet {
        periodTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        periods = CoreDataHelper.retrievePeriods()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return periods.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPeriodTableViewCell", for: indexPath) as! ListPeriodTableViewCell
        
        let period = periods[indexPath.row]
        
        cell.subjectPeriodLabel.text = period.subject
        cell.teacherPeriodLabel.text = period.teacher
        cell.locationPeriodLabel.text = period.location
        
     //   cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown"

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let periodToDelete = periods[indexPath.row]
            CoreDataHelper.delete(period: periodToDelete)
            
            periods = CoreDataHelper.retrievePeriods()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "displayPeriod":
            
            guard let indexPath = periodTableView.indexPathForSelectedRow else { return }

//            let destVC = segue.destination as! UINavigationController
//            let slideVC = destVC.topViewController as! ViewControllerSlide
                let period = periods[indexPath.row]
                let destination = segue.destination as! AddClassController
                    destination.period = period
            print("Transitioning to the Display Note View Controller")
            
        case "cancel":
            print("Transitioning back to Main")
            
        case "confirmNewClass":
            print("Transitioning back to Main")

        default:
            print("unidentified segue identifier")
        }
        
    }
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        periods = CoreDataHelper.retrievePeriods()
    }
}
