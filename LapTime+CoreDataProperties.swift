//
//  LapTime+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData


extension LapTime {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LapTime> {
        return NSFetchRequest<LapTime>(entityName: "LapTime");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var time: Double
    @NSManaged public var toCar: Car?

}
