//
//  CoreDataHelper.swift
//  sced app
//
//  Created by Grace Gong on 7/18/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newPeriod() -> Period {
        let period = NSEntityDescription.insertNewObject(forEntityName: "Period", into: context) as! Period
        
        return period
    }
    
    static func savePeriod() {
        do {
            try context.save()
        } catch let error {
            print("could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(period: Period) {
        context.delete(period)
        
        savePeriod()
    }
    
    static func retrievePeriods() -> [Period] {
        do {
            let fetchRequest = NSFetchRequest<Period>(entityName: "Period")
            let results = try context.fetch(fetchRequest)

            return results
            
        } catch let error {
            print("could not fetch \(error.localizedDescription)")
            return []
        }
    }
}
