//
//  Transit+CoreDataProperties.swift
//  Travel Wallet
//
//  Created by Anand Kulkarni on 4/29/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension Transit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transit> {
        return NSFetchRequest<Transit>(entityName: "Transit")
    }

    @NSManaged public var type: String?
    @NSManaged public var from: String?
    @NSManaged public var to: String?
    @NSManaged public var rawDate: NSDate?

}
