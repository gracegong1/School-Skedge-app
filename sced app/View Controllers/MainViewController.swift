//
//  MainViewController.swift
//  sced app
//
//  Created by Grace Gong on 7/17/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

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
        // 1
//        return periods.count
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listPeriodTableViewCell", for: indexPath) as! ListPeriodTableViewCell
        
        cell.subjectPeriodLabel.text = "period's title"
        cell.timePeriodLabel.text = "period's start time"
        cell.locationPeriodLabel.text = "period's location"
        
//        let period = periods[indexPath.row]

        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "displayPeriod":
            
//            guard let indexPath = periodTableView.indexPathForSelectedRow else { return }
//
//            let period = periods[indexPath.row]
//            let destination = segue.destination as! AddClassController
//            destination.period = period
            print("Transitioning to the Display Note View Controller")
            
        case "cancel":
            print("Transitioning back to Main")
            
        case "addClass":
            print("Transitioning back to Main")

        default:
            print("unidentified segue identifier")
        }
        
    }
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}
