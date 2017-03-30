//
//  StopwatchCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import CoreData

class StopwatchCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var carPicker: UIPickerView!
    @IBOutlet weak var lapTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var carNameLabel: UILabel!

    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var sectionCounter = 1
    var totalCounter = 0.0
    var car = [Car]()
    var accurateStartTime = 0.0
    var accurateEndTime = 0.0
    
    @IBAction func carNameLabelPressed(_ sender: UIButton) {
        carPicker.isHidden = false
    }
    
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        sectionCounter = 1
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        totalCounter = 0.0
        lapTimeLabel.text = "0.0"
        totalTimeLabel.text = "0.0"
    }
    
    @IBAction func startStopButtonPressed(_ sender: UIButton) {
        if isPlaying {
            timer.invalidate()
            isPlaying = false
        } else {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true
            accurateStartTime = NSDate.timeIntervalSinceReferenceDate            
        }
    }
    
    
    
    @IBAction func lapButtonPressed(_ sender: UIButton) {
        if carNameLabel.text != "" || carNameLabel.text != "Select Car" {
            var index = 0
            let accurateTime = NSDate.timeIntervalSinceReferenceDate - accurateStartTime
            repeat {
                let c = car[index]
                if c.name == carNameLabel.text {
                    let laptime = LapTime(context: context)
                    laptime.time = accurateTime
                    c.addToToLaptime(laptime)
                    print("\(c.toLaptime?.count)")
                    ad.saveContext()
                    break
                }
                index += 1
            } while (index < car.count)
        }
        counter = 0.0
        accurateStartTime = NSDate.timeIntervalSinceReferenceDate
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        carPicker.isHidden = true
        carPicker.delegate = self
        carPicker.dataSource = self
        
        getCars()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateTimer() {
        counter += 0.1
        totalCounter += 0.1
        lapTimeLabel.text = String(format:"%.01f", counter)
        totalTimeLabel.text = String(format: "%.01f", totalCounter)
    }
    
    func updateName(car: String) {
        carNameLabel.text = car
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let car = self.car[row]
        return car.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return car.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if car.count >= 1 {
            carNameLabel.text = car[row].name
            carPicker.isHidden = true
        }
    }
    
    
    
    func getCars() {
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        
        do {
            self.car = try context.fetch(fetchRequest)
            self.carPicker.reloadAllComponents()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }

}
