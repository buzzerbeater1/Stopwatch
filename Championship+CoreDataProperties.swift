//
//  Championship+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension Championship {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Championship> {
        return NSFetchRequest<Championship>(entityName: "Championship");
    }

    @NSManaged public var name: String?
    @NSManaged public var registrationFiles: NSObject?
    @NSManaged public var regulations: NSObject?
    @NSManaged public var results: NSObject?
    @NSManaged public var standings: NSObject?
    @NSManaged public var year: String?
    @NSManaged public var toCar: NSSet?
    @NSManaged public var toRaceEvent: NSSet?
    @NSManaged public var toSession: NSSet?

}

// MARK: Generated accessors for toCar
extension Championship {

    @objc(addToCarObject:)
    @NSManaged public func addToToCar(_ value: Car)

    @objc(removeToCarObject:)
    @NSManaged public func removeFromToCar(_ value: Car)

    @objc(addToCar:)
    @NSManaged public func addToToCar(_ values: NSSet)

    @objc(removeToCar:)
    @NSManaged public func removeFromToCar(_ values: NSSet)

}

// MARK: Generated accessors for toRaceEvent
extension Championship {

    @objc(addToRaceEventObject:)
    @NSManaged public func addToToRaceEvent(_ value: RaceEvent)

    @objc(removeToRaceEventObject:)
    @NSManaged public func removeFromToRaceEvent(_ value: RaceEvent)

    @objc(addToRaceEvent:)
    @NSManaged public func addToToRaceEvent(_ values: NSSet)

    @objc(removeToRaceEvent:)
    @NSManaged public func removeFromToRaceEvent(_ values: NSSet)

}

// MARK: Generated accessors for toSession
extension Championship {

    @objc(addToSessionObject:)
    @NSManaged public func addToToSession(_ value: Session)

    @objc(removeToSessionObject:)
    @NSManaged public func removeFromToSession(_ value: Session)

    @objc(addToSession:)
    @NSManaged public func addToToSession(_ values: NSSet)

    @objc(removeToSession:)
    @NSManaged public func removeFromToSession(_ values: NSSet)

}
