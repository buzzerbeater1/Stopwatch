//
//  VoiceNote+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 30/05/2017.
//
//

import Foundation
import CoreData


extension VoiceNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VoiceNote> {
        return NSFetchRequest<VoiceNote>(entityName: "VoiceNote");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var filePath: String?
    @NSManaged public var toCar: Car?
    @NSManaged public var toSetup: Setup?
    @NSManaged public var toSetupRun: SetupRun?

}
