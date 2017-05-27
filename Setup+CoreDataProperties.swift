//
//  Setup+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension Setup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Setup> {
        return NSFetchRequest<Setup>(entityName: "Setup");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var fl: NSObject?
    @NSManaged public var fr: NSObject?
    @NSManaged public var general: NSObject?
    @NSManaged public var rl: NSObject?
    @NSManaged public var rr: NSObject?
    @NSManaged public var toCar: Car?
    @NSManaged public var toPictureNote: NSSet?
    @NSManaged public var toRuns: NSSet?
    @NSManaged public var toVoiceNote: NSSet?
    @NSManaged public var toWrittenNote: NSSet?

}

// MARK: Generated accessors for toPictureNote
extension Setup {

    @objc(addToPictureNoteObject:)
    @NSManaged public func addToToPictureNote(_ value: PictureNote)

    @objc(removeToPictureNoteObject:)
    @NSManaged public func removeFromToPictureNote(_ value: PictureNote)

    @objc(addToPictureNote:)
    @NSManaged public func addToToPictureNote(_ values: NSSet)

    @objc(removeToPictureNote:)
    @NSManaged public func removeFromToPictureNote(_ values: NSSet)

}

// MARK: Generated accessors for toRuns
extension Setup {

    @objc(addToRunsObject:)
    @NSManaged public func addToToRuns(_ value: Runs)

    @objc(removeToRunsObject:)
    @NSManaged public func removeFromToRuns(_ value: Runs)

    @objc(addToRuns:)
    @NSManaged public func addToToRuns(_ values: NSSet)

    @objc(removeToRuns:)
    @NSManaged public func removeFromToRuns(_ values: NSSet)

}

// MARK: Generated accessors for toVoiceNote
extension Setup {

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
extension Setup {

    @objc(addToWrittenNoteObject:)
    @NSManaged public func addToToWrittenNote(_ value: WrittenNote)

    @objc(removeToWrittenNoteObject:)
    @NSManaged public func removeFromToWrittenNote(_ value: WrittenNote)

    @objc(addToWrittenNote:)
    @NSManaged public func addToToWrittenNote(_ values: NSSet)

    @objc(removeToWrittenNote:)
    @NSManaged public func removeFromToWrittenNote(_ values: NSSet)

}
