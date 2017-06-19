//
//  WeatherVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewControllerStatusBar, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentBarValueChanged(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=metric&appid=231c48bccd7e1cb39c9cb24606746e54"
            
            FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&units=metric&appid=231c48bccd7e1cb39c9cb24606746e54"
        } else {
            CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?q=\(event.location!),cn&units=metric&appid=231c48bccd7e1cb39c9cb24606746e54"
            
            FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast?q=\(event.location!),cn&units=metric&appid=231c48bccd7e1cb39c9cb24606746e54"
        }
        currentWeather.donwloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    var event: RaceEvent!
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentWeather = CurrentWeather()
    var forecast: WeatherForecast!
    var forecasts = [WeatherForecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        tableView.delegate = self
        tableView.dataSource = self
        locationAuthStatus()
        currentWeather.donwloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell {
            let forecast = forecasts[indexPath.row + 1]
            cell.configureCell(forecast: forecast)
            return cell
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = String(format:"%.02f°", currentWeather.currentTemp)
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        Alamofire.request(FORECAST_URL).responseJSON { response in
            let result = response.result
            self.forecasts = []
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let list = dict["list"] as? [Dictionary<String,AnyObject>] {
                    for obj in list {
                        let date = obj["dt"] as! Double
                        if date > (self.event.startDate?.timeIntervalSince1970)! && date < (self.event.endDate?.timeIntervalSince1970)! {
                            let forecast = WeatherForecast(weatherDict: obj)
                            self.forecasts.append(forecast)
                            print("valid")
                        } else {
                            print("Failed")
                        }
                    }
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        currentLocation = locationManager.location
        Location.sharedInstance.latitude = currentLocation.coordinate.latitude
        Location.sharedInstance.longitude = currentLocation.coordinate.longitude
    }

}
