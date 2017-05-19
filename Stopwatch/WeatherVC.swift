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
        locationManager.requestWhenInUseAuthorization()
        tableView.delegate = self
        tableView.dataSource = self
        locationAuthStatus()
        currentWeather.donwloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
        print(FORECAST_URL)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
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
            print(result)
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
        print(Location.sharedInstance.latitude,Location.sharedInstance.longitude)
    }

}
