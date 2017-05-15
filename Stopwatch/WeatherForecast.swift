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
    var _temp: String!
    var _weatherType: String!
    var _date: String!
    var _rain: String!
    
    
    var temp: String {
        if _temp == nil {
            _temp = ""
        }
        return _temp
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var rain: String {
        if _rain == nil {
            _rain = ""
        }
        return _rain
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    
    
    init( weatherDict: Dictionary<String,AnyObject>) {
        if let main = weatherDict["main"] as? Dictionary<String, AnyObject> {
            if let temp = main["temp"] as? Double {
                self._temp = String(format:"%.02f°", temp)
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        if let date = weatherDict["dt"] as? Double {
            var unixConvertDate = Date(timeIntervalSince1970: date)
            unixConvertDate.addTimeInterval(25200)
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateStyle = .full
//            dateFormatter.dateFormat = "E, HH:mm"
//            dateFormatter.timeStyle = .short
            self._date = unixConvertDate.dayOfTheWeek()
        }
        
        if let rain = weatherDict["rain"] as? Dictionary<String,AnyObject> {
            if let amount = rain["3h"] as? Double {
                self._rain = String(format:"%.02fmm", amount)
            }
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
