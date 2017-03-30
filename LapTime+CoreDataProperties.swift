//
//  LapTime+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension LapTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LapTime> {
        return NSFetchRequest<LapTime>(entityName: "LapTime");
    }

    @NSManaged public var time: Double
    @NSManaged public var created: Date
    @NSManaged public var toCar: Car?

}
