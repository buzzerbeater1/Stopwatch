//
//  VoiceNote+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension VoiceNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VoiceNote> {
        return NSFetchRequest<VoiceNote>(entityName: "VoiceNote");
    }

    @NSManaged public var created: String?
    @NSManaged public var voice: NSObject?
    @NSManaged public var toCar: Car?
    @NSManaged public var toSetup: Setup?
    @NSManaged public var toSetupRun: SetupRun?

}
