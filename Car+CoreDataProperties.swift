//
//  Car+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 18/05/2017.
//
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
    @NSManaged public var joblist: String?
    @NSManaged public var make: String?
    @NSManaged public var number: String?
    @NSManaged public var toChampionship: NSSet?
    @NSManaged public var toLaptime: NSSet?
    @NSManaged public var toPictureNote: NSSet?
    @NSManaged public var toRaceEvent: NSSet?
    @NSManaged public var toRuns: NSSet?
    @NSManaged public var toSession: NSSet?
    @NSManaged public var toSetup: NSSet?
    @NSManaged public var toVoiceNote: NSSet?
    @NSManaged public var toWrittenNote: NSSet?
    @NSManaged public var toDriver: NSSet?

}

// MARK: Generated accessors for toChampionship
extension Car {

    @objc(addToChampionshipObject:)
    @NSManaged public func addToToChampionship(_ value: Championship)

    @objc(removeToChampionshipObject:)
    @NSManaged public func removeFromToChampionship(_ value: Championship)

    @objc(addToChampionship:)
    @NSManaged public func addToToChampionship(_ values: NSSet)

    @objc(removeToChampionship:)
    @NSManaged public func removeFromToChampionship(_ values: NSSet)

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

// MARK: Generated accessors for toPictureNote
extension Car {

    @objc(addToPictureNoteObject:)
    @NSManaged public func addToToPictureNote(_ value: PictureNote)

    @objc(removeToPictureNoteObject:)
    @NSManaged public func removeFromToPictureNote(_ value: PictureNote)

    @objc(addToPictureNote:)
    @NSManaged public func addToToPictureNote(_ values: NSSet)

    @objc(removeToPictureNote:)
    @NSManaged public func removeFromToPictureNote(_ values: NSSet)

}

// MARK: Generated accessors for toRaceEvent
extension Car {

    @objc(addToRaceEventObject:)
    @NSManaged public func addToToRaceEvent(_ value: RaceEvent)

    @objc(removeToRaceEventObject:)
    @NSManaged public func removeFromToRaceEvent(_ value: RaceEvent)

    @objc(addToRaceEvent:)
    @NSManaged public func addToToRaceEvent(_ values: NSSet)

    @objc(removeToRaceEvent:)
    @NSManaged public func removeFromToRaceEvent(_ values: NSSet)

}

// MARK: Generated accessors for toRuns
extension Car {

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
extension Car {

    @objc(addToSessionObject:)
    @NSManaged public func addToToSession(_ value: Session)

    @objc(removeToSessionObject:)
    @NSManaged public func removeFromToSession(_ value: Session)

    @objc(addToSession:)
    @NSManaged public func addToToSession(_ values: NSSet)

    @objc(removeToSession:)
    @NSManaged public func removeFromToSession(_ values: NSSet)

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

// MARK: Generated accessors for toVoiceNote
extension Car {

    @objc(addToVoiceNoteObject:)
    @NSManaged public func addToToVoiceNote(_ value: VoiceNote)

    @objc(removeToVoiceNoteObject:)
    @NSManaged public func removeFromToVoiceNote(_ value: VoiceNote)

    @objc(addToVoiceNote:)
    @NSManaged public func addToToVoiceNote(_ values: NSSet)

    @objc(removeToVoiceNote:)
    @NSManaged public func removeFromToVoiceNote(_ values: NSSet)

}

// MARK: Generated accessors for toWrittenNote
extension Car {

    @objc(addToWrittenNoteObject:)
    @NSManaged public func addToToWrittenNote(_ value: WrittenNote)

    @objc(removeToWrittenNoteObject:)
    @NSManaged public func removeFromToWrittenNote(_ value: WrittenNote)

    @objc(addToWrittenNote:)
    @NSManaged public func addToToWrittenNote(_ values: NSSet)

    @objc(removeToWrittenNote:)
    @NSManaged public func removeFromToWrittenNote(_ values: NSSet)

}

// MARK: Generated accessors for toDriver
extension Car {

    @objc(addToDriverObject:)
    @NSManaged public func addToToDriver(_ value: Driver)

    @objc(removeToDriverObject:)
    @NSManaged public func removeFromToDriver(_ value: Driver)

    @objc(addToDriver:)
    @NSManaged public func addToToDriver(_ values: NSSet)

    @objc(removeToDriver:)
    @NSManaged public func removeFromToDriver(_ values: NSSet)

}
