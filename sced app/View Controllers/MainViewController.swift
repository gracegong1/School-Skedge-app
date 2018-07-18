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
    
    var periods = [CLASSHERE]() {
    didSet {

        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return notes.count
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayPeriod":
            
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            
            let note = notes[indexPath.row]
            let destination = segue.destination as! DisplayNoteViewController
            destination.note = note
            
        case "addNote":
            print("create note bar button item tapped")
            
        default:
            print("unidentified segue identifier")
        }
    }
}
