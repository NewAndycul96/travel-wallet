//
//  Activity+CoreDataClass.swift
//  Travel Wallet
//
//  Created by 王 on 2018/5/6.
//  Copyright © 2018年 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Activity)
public class Activity: NSManagedObject {
    var time: Date?{
        get {
            return activityTime as Date?
        }
        set {
            activityTime = newValue as NSDate?
        }
    }
    
    
    convenience init?(type: String?, location: String?, activityTime: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {
            return nil
        }
        
        self.init(entity: Activity.entity(), insertInto: managedContext)
        
        self.type = type
        self.location = location
        self.time = activityTime
        //self.image = image
        
        
    }
}
