//
//  Trip+CoreDataProperties.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/28/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension Trip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trip> {
        return NSFetchRequest<Trip>(entityName: "Trip")
    }

    @NSManaged public var tripName: String?
    @NSManaged public var destination: String?
    @NSManaged public var rawStartDate: NSDate?
    @NSManaged public var rawEndDate: NSDate?

}
