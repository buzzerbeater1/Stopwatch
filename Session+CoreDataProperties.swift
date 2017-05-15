//
//  Session+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 10/05/2017.
//
//

import Foundation
import CoreData


extension Session {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Session> {
        return NSFetchRequest<Session>(entityName: "Session");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var details: String?
    @NSManaged public var endTime: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var startTime: NSDate?
    @NSManaged public var eventDay: String?
    @NSManaged public var toCar: NSSet?
    @NSManaged public var toChampionship: Championship?
    @NSManaged public var toRaceEvent: RaceEvent?
    @NSManaged public var toRuns: NSSet?
    @NSManaged public var toWeatherMonitor: WeaterMonitor?

}

// MARK: Generated accessors for toCar
extension Session {

    @objc(addToCarObject:)
    @NSManaged public func addToToCar(_ value: Car)

    @objc(removeToCarObject:)
    @NSManaged public func removeFromToCar(_ value: Car)

    @objc(addToCar:)
    @NSManaged public func addToToCar(_ values: NSSet)

    @objc(removeToCar:)
    @NSManaged public func removeFromToCar(_ values: NSSet)

}

// MARK: Generated accessors for toRuns
extension Session {

    @objc(addToRunsObject:)
    @NSManaged public func addToToRuns(_ value: Runs)

    @objc(removeToRunsObject:)
    @NSManaged public func removeFromToRuns(_ value: Runs)

    @objc(addToRuns:)
    @NSManaged public func addToToRuns(_ values: NSSet)

    @objc(removeToRuns:)
    @NSManaged public func removeFromToRuns(_ values: NSSet)

}
