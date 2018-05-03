//
//  Hotel+CoreDataClass.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Hotel)
public class Hotel: NSManagedObject {
    var checkIn: Date? {
        get{
            return rawCheckIn as Date?
        }
        set{
            rawCheckIn = newValue as NSDate?
        }
    }
    var checkOut: Date?{
        get{
            return rawCheckOut as Date?
        }
        set{
            rawCheckOut = newValue as NSDate?
        }
        
    }
    
    convenience init?(name: String?, checkIn: Date?, checkOut: Date?, confirmation: String?, durationOfStay: Int16, address: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Hotel.entity(), insertInto: managedContext)
        
        self.name = name
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.confirmation = confirmation
        self.durationOfStay = durationOfStay
        self.address = address
        
    }
}
