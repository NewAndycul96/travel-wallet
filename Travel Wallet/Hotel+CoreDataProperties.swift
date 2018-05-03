//
//  Hotel+CoreDataProperties.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension Hotel {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hotel> {
        return NSFetchRequest<Hotel>(entityName: "Hotel")
    }
    
    @NSManaged public var name: String?
    @NSManaged public var rawCheckIn: NSDate?
    @NSManaged public var rawCheckOut: NSDate?
    @NSManaged public var confirmation: String?
    @NSManaged public var durationOfStay: Int16
    @NSManaged public var address: String?
    
}
