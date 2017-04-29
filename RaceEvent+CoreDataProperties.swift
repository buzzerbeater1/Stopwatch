//
//  RaceEvent+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/26/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension RaceEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceEvent> {
        return NSFetchRequest<RaceEvent>(entityName: "RaceEvent");
    }

    @NSManaged public var startDate: NSDate?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var circuit: String?
    @NSManaged public var toCar: NSSet?

}

// MARK: Generated accessors for toCar
extension RaceEvent {

    @objc(addToCarObject:)
    @NSManaged public func addToToCar(_ value: Car)

    @objc(removeToCarObject:)
    @NSManaged public func removeFromToCar(_ value: Car)

    @objc(addToCar:)
    @NSManaged public func addToToCar(_ values: NSSet)

    @objc(removeToCar:)
    @NSManaged public func removeFromToCar(_ values: NSSet)

}
