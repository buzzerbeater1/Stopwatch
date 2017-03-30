//
//  PitLaneTime+CoreDataProperties.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData


extension PitLaneTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PitLaneTime> {
        return NSFetchRequest<PitLaneTime>(entityName: "PitLaneTime");
    }

    @NSManaged public var comment: String?
    @NSManaged public var section1Time: Double
    @NSManaged public var section2Time: Double
    @NSManaged public var section3Time: Double
    @NSManaged public var section4Time: Double
    @NSManaged public var section5Time: Double
    @NSManaged public var totalTime: Double

}
