//
//  Setup+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension Setup {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Setup> {
        return NSFetchRequest<Setup>(entityName: "Setup");
    }

    @NSManaged public var tirePressureFL: Double
    @NSManaged public var tirePressureRL: Double
    @NSManaged public var tirePressureFR: Double
    @NSManaged public var tirePressureRR: Double
    @NSManaged public var created: NSDate?
    @NSManaged public var toCar: Car?

}
