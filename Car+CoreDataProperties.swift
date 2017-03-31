//
//  Car+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/31/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension Car {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Car> {
        return NSFetchRequest<Car>(entityName: "Car");
    }

    @NSManaged public var model: String?
    @NSManaged public var name: String?
    @NSManaged public var picture: NSObject?
    @NSManaged public var toLaptime: NSSet?
    @NSManaged public var toSetup: NSSet?
    @NSManaged public var toNote: NSSet?

}

// MARK: Generated accessors for toLaptime
extension Car {

    @objc(addToLaptimeObject:)
    @NSManaged public func addToToLaptime(_ value: LapTime)

    @objc(removeToLaptimeObject:)
    @NSManaged public func removeFromToLaptime(_ value: LapTime)

    @objc(addToLaptime:)
    @NSManaged public func addToToLaptime(_ values: NSSet)

    @objc(removeToLaptime:)
    @NSManaged public func removeFromToLaptime(_ values: NSSet)

}

// MARK: Generated accessors for toSetup
extension Car {

    @objc(addToSetupObject:)
    @NSManaged public func addToToSetup(_ value: Setup)

    @objc(removeToSetupObject:)
    @NSManaged public func removeFromToSetup(_ value: Setup)

    @objc(addToSetup:)
    @NSManaged public func addToToSetup(_ values: NSSet)

    @objc(removeToSetup:)
    @NSManaged public func removeFromToSetup(_ values: NSSet)

}

// MARK: Generated accessors for toNote
extension Car {

    @objc(addToNoteObject:)
    @NSManaged public func addToToNote(_ value: Note)

    @objc(removeToNoteObject:)
    @NSManaged public func removeFromToNote(_ value: Note)

    @objc(addToNote:)
    @NSManaged public func addToToNote(_ values: NSSet)

    @objc(removeToNote:)
    @NSManaged public func removeFromToNote(_ values: NSSet)

}
