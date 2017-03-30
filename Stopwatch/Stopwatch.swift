//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import UIKit

class Stopwatch {
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var sectionCounter = 1
    var totalCounter = 0.0
    
    func startStopTimer() {
        if isPlaying {
            timer.invalidate()
            isPlaying = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true
        }
    }
    
    func lapTimer() {
        counter = 0.0
        
    }
    
    func resetTimer() {
        sectionCounter = 1
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        totalCounter = 0.0
    }
    
    @objc func updateTimer() {
        counter += 0.1
        totalCounter += 0.1
    }
    
    
    
    
}
