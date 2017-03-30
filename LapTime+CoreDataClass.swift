//
//  LapTime+CoreDataClass.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import CoreData

@objc(LapTime)
public class LapTime: NSManagedObject {
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate() as Date
    }

}
