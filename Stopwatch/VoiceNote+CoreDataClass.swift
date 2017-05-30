//
//  VoiceNote+CoreDataClass.swift
//  
//
//  Created by Michael Derstroff on 5/6/17.
//
//

import Foundation
import CoreData

@objc(VoiceNote)
public class VoiceNote: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate() as NSDate?
    }
    
}
