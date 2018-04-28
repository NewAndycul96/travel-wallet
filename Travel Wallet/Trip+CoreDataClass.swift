//
//  Trip+CoreDataClass.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/28/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Trip)
public class Trip: NSManagedObject {
    var date: Date? {
        get {
            return rawStartDate as Date?
        }
        set {
            rawStartDate = newValue as NSDate?
        }
    }
    convenience init?(tripName: String?, destination: String?, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Trip.entity(), insertInto: managedContext)
        
        self.tripName = tripName
        self.destination = destination
        self.date = date
    }
}
