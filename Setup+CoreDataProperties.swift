//
//  Setup+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/12/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
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
    @NSManaged public var rl: NSObject?
    @NSManaged public var rr: NSObject?
    @NSManaged public var general: NSObject?
    @NSManaged public var setupNew: NSObject?
    @NSManaged public var toCar: Car?
    @NSManaged public var toNote: Note?

}
