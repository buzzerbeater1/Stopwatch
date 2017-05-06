//
//  WeatherForecast.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import Alamofire

class WeatherForecast {
    var _lowTemp: String!
    var _weatherType: String!
    var _date: String!
    var _highTemp: String!
    
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    
    
    init( weatherDict: Dictionary<String,AnyObject>) {
        if let main = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let min = main["temp_min"] as? Double {
                print(min)
                let minCelsius = min - 273.15
                self._lowTemp = String(format:"%.02f°", minCelsius)
            }
            if let max = main["temp_max"] as? Double {
                let maxCelsius = max - 273.15
                self._highTemp = String(format:"%.02f°", maxCelsius)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            let unixConvertDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "E, HH:mm"
            dateFormatter.timeStyle = .short
            self._date = unixConvertDate.dayOfTheWeek()
        }
    }
    
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, HH:mm"
        return dateFormatter.string(from:self)
    }
}
