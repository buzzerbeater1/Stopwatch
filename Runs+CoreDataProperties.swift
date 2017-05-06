//
//  Runs+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 5/6/17.
//
//

import Foundation
import CoreData


extension Runs {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Runs> {
        return NSFetchRequest<Runs>(entityName: "Runs");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var toCar: NSSet?
    @NSManaged public var toRaceEvent: RaceEvent?
    @NSManaged public var toSession: Session?
    @NSManaged public var toSetup: NSSet?

}

// MARK: Generated accessors for toCar
extension Runs {

    @objc(addToCarObject:)
    @NSManaged public func addToToCar(_ value: Car)

    @objc(removeToCarObject:)
    @NSManaged public func removeFromToCar(_ value: Car)

    @objc(addToCar:)
    @NSManaged public func addToToCar(_ values: NSSet)

    @objc(removeToCar:)
    @NSManaged public func removeFromToCar(_ values: NSSet)

}

// MARK: Generated accessors for toSetup
extension Runs {

    @objc(addToSetupObject:)
    @NSManaged public func addToToSetup(_ value: Setup)

    @objc(removeToSetupObject:)
    @NSManaged public func removeFromToSetup(_ value: Setup)

    @objc(addToSetup:)
    @NSManaged public func addToToSetup(_ values: NSSet)

    @objc(removeToSetup:)
    @NSManaged public func removeFromToSetup(_ values: NSSet)

}
