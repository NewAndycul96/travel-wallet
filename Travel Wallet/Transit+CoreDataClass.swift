//
//  Transit+CoreDataClass.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/29/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Transit)
public class Transit: NSManagedObject {
    var startDate: Date? {
        get {
                return rawStartDate as Date?
        }
        set {
            rawStartDate = newValue as NSDate?
        }
    }
    var endDate: Date?{
        get {
            return rawEndDate as Date?
        }
        set {
            rawEndDate = newValue as NSDate?
        }
    }
    
    convenience init?(type: String?, from: String?, to: String?, startDate: Date?, endDate: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Transit.entity(), insertInto: managedContext)
        
        self.type = type
        self.from = from
        self.to = to
        self.startDate = startDate
        self.endDate = endDate
    }
}
