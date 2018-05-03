//
//  NameOfTrip+CoreDataClass.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import UIKit
import CoreData

@objc(NameOfTrip)
public class NameOfTrip: NSManagedObject {
    var tripsNames: [NameOfTrip]?{
        return self.rawTrips?.array as? [NameOfTrip]
    }
    
    convenience init?(nameOfTrip: String) {
     let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: NameOfTrip.entity(), insertInto: context)
        
        self.nameOfTrip = nameOfTrip
    }

}
