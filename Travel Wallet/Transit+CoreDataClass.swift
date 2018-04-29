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
    var date: Date? {
        get {
                return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate?
        }
    }
    
    convenience init?(type: String?, from: String?, to: String?, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Transit.entity(), insertInto: managedContext)
        
        self.type = type
        self.from = from
        self.to = to
        self.date = date
    }
}
