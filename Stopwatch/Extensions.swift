//
//  Extensions.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/29/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.index(of: object) {
            self.remove(at: index)
        }
    }
    
    mutating func removeObjectsInArray(array: [Element]) {
        for object in array {
            self.removeObject(object: object)
        }
    }
}
