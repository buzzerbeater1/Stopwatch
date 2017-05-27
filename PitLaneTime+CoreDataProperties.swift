//
//  PitLaneTime+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
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
