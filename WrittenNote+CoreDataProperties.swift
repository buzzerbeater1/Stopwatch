//
//  WrittenNote+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension WrittenNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WrittenNote> {
        return NSFetchRequest<WrittenNote>(entityName: "WrittenNote");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var written: String?
    @NSManaged public var toCar: Car?
    @NSManaged public var toSetup: Setup?
    @NSManaged public var toSetupRun: SetupRun?

}
