//
//  MainViewController.swift
//  sced app
//
//  Created by Grace Gong on 7/17/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITableViewController {
    
    var periods = [Period]() {
    didSet {

        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return periods.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListPeriodTableViewCell
        
        cell.subjectPeriodLabel.text = "period's title"
        cell.timePeriodLabel.text = "period's start time"
        cell.locationPeriodLabel.text = "period's location"
        
        let period = periods[indexPath.row]

        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayPeriod":
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let period = periods[indexPath.row]
            let destination = segue.destination as! AddClassController
            destination.period = period
            
        default:
            print("unidentified segue identifier")
        }
    }
}
