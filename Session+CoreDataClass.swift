//
//  Session+CoreDataClass.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/3/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData

@objc(Session)
public class Session: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate() as NSDate?
    }
    
}
