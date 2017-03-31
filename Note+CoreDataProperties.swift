//
//  Note+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/31/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var written: String?
    @NSManaged public var voice: NSObject?
    @NSManaged public var picture: NSObject?
    @NSManaged public var toSetup: Setup?
    @NSManaged public var toCar: Car?

}
