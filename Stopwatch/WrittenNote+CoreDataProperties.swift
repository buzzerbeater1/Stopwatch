//
//  WrittenNote+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 5/6/17.
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

}
