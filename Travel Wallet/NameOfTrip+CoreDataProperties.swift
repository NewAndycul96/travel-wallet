//
//  NameOfTrip+CoreDataProperties.swift
//  Travel Wallet
//
//  Created by Allison Dolan on 5/3/18.
//  Copyright © 2018 Anand Kulkarni. All rights reserved.
//
//

import Foundation
import CoreData


extension NameOfTrip {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NameOfTrip> {
        return NSFetchRequest<NameOfTrip>(entityName: "NameOfTrip")
    }

    @NSManaged public var nameOfTrip: String?
    @NSManaged public var rawTrips: NSOrderedSet?

}

// MARK: Generated accessors for rawTrips
extension NameOfTrip {

    @objc(insertObject:inRawTripsAtIndex:)
    @NSManaged public func insertIntoRawTrips(_ value: Trip, at idx: Int)

    @objc(removeObjectFromRawTripsAtIndex:)
    @NSManaged public func removeFromRawTrips(at idx: Int)

    @objc(insertRawTrips:atIndexes:)
    @NSManaged public func insertIntoRawTrips(_ values: [Trip], at indexes: NSIndexSet)

    @objc(removeRawTripsAtIndexes:)
    @NSManaged public func removeFromRawTrips(at indexes: NSIndexSet)

    @objc(replaceObjectInRawTripsAtIndex:withObject:)
    @NSManaged public func replaceRawTrips(at idx: Int, with value: Trip)

    @objc(replaceRawTripsAtIndexes:withRawTrips:)
    @NSManaged public func replaceRawTrips(at indexes: NSIndexSet, with values: [Trip])

    @objc(addRawTripsObject:)
    @NSManaged public func addToRawTrips(_ value: Trip)

    @objc(removeRawTripsObject:)
    @NSManaged public func removeFromRawTrips(_ value: Trip)

    @objc(addRawTrips:)
    @NSManaged public func addToRawTrips(_ values: NSOrderedSet)

    @objc(removeRawTrips:)
    @NSManaged public func removeFromRawTrips(_ values: NSOrderedSet)

}
