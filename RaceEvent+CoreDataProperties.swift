//
//  RaceEvent+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension RaceEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RaceEvent> {
        return NSFetchRequest<RaceEvent>(entityName: "RaceEvent");
    }

    @NSManaged public var circuit: String?
    @NSManaged public var endDate: NSDate?
    @NSManaged public var location: String?
    @NSManaged public var name: String?
    @NSManaged public var startDate: NSDate?
    @NSManaged public var toCar: NSSet?
    @NSManaged public var toChampionship: Championship?
    @NSManaged public var toRacetrack: Racetrack?
    @NSManaged public var toRuns: NSSet?
    @NSManaged public var toSession: NSSet?
    @NSManaged public var toWeatherMonitor: WeaterMonitor?
    @NSManaged public var toSetupRun: NSSet?

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

// MARK: Generated accessors for toRuns
extension RaceEvent {

    @objc(addToRunsObject:)
    @NSManaged public func addToToRuns(_ value: Runs)

    @objc(removeToRunsObject:)
    @NSManaged public func removeFromToRuns(_ value: Runs)

    @objc(addToRuns:)
    @NSManaged public func addToToRuns(_ values: NSSet)

    @objc(removeToRuns:)
    @NSManaged public func removeFromToRuns(_ values: NSSet)

}

// MARK: Generated accessors for toSession
extension RaceEvent {

    @objc(addToSessionObject:)
    @NSManaged public func addToToSession(_ value: Session)

    @objc(removeToSessionObject:)
    @NSManaged public func removeFromToSession(_ value: Session)

    @objc(addToSession:)
    @NSManaged public func addToToSession(_ values: NSSet)

    @objc(removeToSession:)
    @NSManaged public func removeFromToSession(_ values: NSSet)

}

// MARK: Generated accessors for toSetupRun
extension RaceEvent {

    @objc(addToSetupRunObject:)
    @NSManaged public func addToToSetupRun(_ value: SetupRun)

    @objc(removeToSetupRunObject:)
    @NSManaged public func removeFromToSetupRun(_ value: SetupRun)

    @objc(addToSetupRun:)
    @NSManaged public func addToToSetupRun(_ values: NSSet)

    @objc(removeToSetupRun:)
    @NSManaged public func removeFromToSetupRun(_ values: NSSet)

}
