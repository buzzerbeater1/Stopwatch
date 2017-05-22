//
//  StopwatchVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/22/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class StopwatchVC: UIViewControllerStatusBar {
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var section1Label: UILabel!
    @IBOutlet weak var section2Label: UILabel!
    @IBOutlet weak var section3Label: UILabel!
    @IBOutlet weak var section4Label: UILabel!
    @IBOutlet weak var section5Label: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var sectionCounter = 1
    var totalCounter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        timeLabel.text = String(counter)
        pauseButton.isEnabled = false
    }

    @IBAction func startTimer(_ sender: UIButton) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    @IBAction func pauseTimer(_ sender: UIButton) {
        sectionCounter += 1
        counter = 0.0
        if sectionCounter == 6 {
            startButton.isEnabled = false
            pauseButton.isEnabled = false
            timer.invalidate()
            isPlaying = false
            
        }
    }
    @IBAction func resetTimer(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        sectionCounter = 1
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        totalCounter = 0.0
        timeLabel.text = String(counter)
        section1Label.text = "0.0"
        section2Label.text = "0.0"
        section3Label.text = "0.0"
        section4Label.text = "0.0"
        section5Label.text = "0.0"
        totalTimeLabel.text = "0.0"
    }
    
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "StopwatchVC", sender: nil)
    }
    
    
    @IBAction func PreviousButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func UpdateTimer() {
        counter += 0.1
        totalCounter += 0.1
        if sectionCounter == 1 {
            section1Label.text = String(format: "%.1f", counter)
        } else if sectionCounter == 2 {
            section2Label.text = String(format: "%.1f", counter)
        } else if sectionCounter == 3 {
            section3Label.text = String(format: "%.1f", counter)
        } else if sectionCounter == 4 {
            section4Label.text = String(format: "%.1f", counter)
        } else {
            section5Label.text = String(format: "%.1f", counter)
        }
        totalTimeLabel.text = String(format: "%.1f", totalCounter)
    }
    
    


}

