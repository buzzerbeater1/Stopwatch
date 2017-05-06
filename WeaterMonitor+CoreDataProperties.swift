//
//  WeaterMonitor+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 5/6/17.
//
//

import Foundation
import CoreData


extension WeaterMonitor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeaterMonitor> {
        return NSFetchRequest<WeaterMonitor>(entityName: "WeaterMonitor");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var data: NSObject?
    @NSManaged public var toRaceEvent: RaceEvent?
    @NSManaged public var toSession: Session?

}
