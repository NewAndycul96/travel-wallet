//
//  Activity+CoreDataProperties.swift
//  Travel Wallet
//
//  Created by 王 on 2018/5/6.
//  Copyright © 2018年 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension Activity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Activity> {
        return NSFetchRequest<Activity>(entityName: "Activity")
    }

    @NSManaged public var type: String?
    @NSManaged public var location: String?
    @NSManaged public var activityTime: NSDate?
    @NSManaged public var image: NSData?

}
