//
//  Driver+CoreDataProperties.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Driver {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Driver> {
        return NSFetchRequest<Driver>(entityName: "Driver");
    }

    @NSManaged public var bloodType: String?
    @NSManaged public var image: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var toCar: NSSet?

}

// MARK: Generated accessors for toCar
extension Driver {

    @objc(addToCarObject:)
    @NSManaged public func addToToCar(_ value: Car)

    @objc(removeToCarObject:)
    @NSManaged public func removeFromToCar(_ value: Car)

    @objc(addToCar:)
    @NSManaged public func addToToCar(_ values: NSSet)

    @objc(removeToCar:)
    @NSManaged public func removeFromToCar(_ values: NSSet)

}
