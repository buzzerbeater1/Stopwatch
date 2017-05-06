//
//  PictureNote+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 5/6/17.
//
//

import Foundation
import CoreData


extension PictureNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PictureNote> {
        return NSFetchRequest<PictureNote>(entityName: "PictureNote");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var picture: NSObject?
    @NSManaged public var toCar: Car?
    @NSManaged public var toSetup: Setup?

}
