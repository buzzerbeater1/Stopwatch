//
//  SetupRun+CoreDataClass.swift
//  
//
//  Created by Michael Derstroff on 27/05/2017.
//
//

import Foundation
import CoreData

@objc(SetupRun)
public class SetupRun: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate() as NSDate?
    }
    
}
