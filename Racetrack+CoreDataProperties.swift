//
//  Racetrack+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Racetrack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Racetrack> {
        return NSFetchRequest<Racetrack>(entityName: "Racetrack");
    }

    @NSManaged public var location: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var toRaceEvent: NSSet?

}

// MARK: Generated accessors for toRaceEvent
extension Racetrack {

    @objc(addToRaceEventObject:)
    @NSManaged public func addToToRaceEvent(_ value: RaceEvent)

    @objc(removeToRaceEventObject:)
    @NSManaged public func removeFromToRaceEvent(_ value: RaceEvent)

    @objc(addToRaceEvent:)
    @NSManaged public func addToToRaceEvent(_ values: NSSet)

    @objc(removeToRaceEvent:)
    @NSManaged public func removeFromToRaceEvent(_ values: NSSet)

}
