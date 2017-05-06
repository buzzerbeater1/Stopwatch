//
//  WeatherConstants.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation

import Foundation

//let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
//let LATITUDE = "lat="
//let LONGITUDE = "&lon="
//let APP_ID = "&appid="
//let API_KEY = "231c48bccd7e1cb39c9cb24606746e54"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=231c48bccd7e1cb39c9cb24606746e54"

let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=231c48bccd7e1cb39c9cb24606746e54"
