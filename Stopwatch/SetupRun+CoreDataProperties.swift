//
//  SetupRun+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension SetupRun {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SetupRun> {
        return NSFetchRequest<SetupRun>(entityName: "SetupRun");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var tirePressureFL: String?
    @NSManaged public var tirePressureFR: String?
    @NSManaged public var tirePressureRL: String?
    @NSManaged public var tirePressureRR: String?
    @NSManaged public var fuel: String?
    @NSManaged public var trackTemp: String?
    @NSManaged public var airTemp: String?
    @NSManaged public var tireTemperatureFROut: String?
    @NSManaged public var tireTemperatureFRMid: String?
    @NSManaged public var tireTemperatureFRIn: String?
    @NSManaged public var tireTemperatureFLMid: String?
    @NSManaged public var tireTemperatureFLIn: String?
    @NSManaged public var tireTemperatureFLOut: String?
    @NSManaged public var tireTemperatureRLIn: String?
    @NSManaged public var tireTemperatureRLMid: String?
    @NSManaged public var tireTemperatureRLOut: String?
    @NSManaged public var tireTemperatureRROut: String?
    @NSManaged public var tireTemperatureRRMid: String?
    @NSManaged public var tireTemperatureRRIn: String?
    @NSManaged public var toCar: Car?
    @NSManaged public var toRaceEvent: RaceEvent?
    @NSManaged public var toSession: Session?
    @NSManaged public var toVoiceNote: NSSet?
    @NSManaged public var toPictureNote: NSSet?
    @NSManaged public var toWrittenNote: NSSet?

}

// MARK: Generated accessors for toVoiceNote
extension SetupRun {

    @objc(addToVoiceNoteObject:)
    @NSManaged public func addToToVoiceNote(_ value: VoiceNote)

    @objc(removeToVoiceNoteObject:)
    @NSManaged public func removeFromToVoiceNote(_ value: VoiceNote)

    @objc(addToVoiceNote:)
    @NSManaged public func addToToVoiceNote(_ values: NSSet)

    @objc(removeToVoiceNote:)
    @NSManaged public func removeFromToVoiceNote(_ values: NSSet)

}

// MARK: Generated accessors for toPictureNote
extension SetupRun {

    @objc(addToPictureNoteObject:)
    @NSManaged public func addToToPictureNote(_ value: PictureNote)

    @objc(removeToPictureNoteObject:)
    @NSManaged public func removeFromToPictureNote(_ value: PictureNote)

    @objc(addToPictureNote:)
    @NSManaged public func addToToPictureNote(_ values: NSSet)

    @objc(removeToPictureNote:)
    @NSManaged public func removeFromToPictureNote(_ values: NSSet)

}

// MARK: Generated accessors for toWrittenNote
extension SetupRun {

    @objc(addToWrittenNoteObject:)
    @NSManaged public func addToToWrittenNote(_ value: WrittenNote)

    @objc(removeToWrittenNoteObject:)
    @NSManaged public func removeFromToWrittenNote(_ value: WrittenNote)

    @objc(addToWrittenNote:)
    @NSManaged public func addToToWrittenNote(_ values: NSSet)

    @objc(removeToWrittenNote:)
    @NSManaged public func removeFromToWrittenNote(_ values: NSSet)

}
