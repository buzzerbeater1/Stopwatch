//
//  WeatherCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 5/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var rain: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    func configureCell(forecast: WeatherForecast) {
        temp.text = forecast.temp
        rain.text = forecast.rain
        weatherType.text = forecast.weatherType
        dayLabel.text = forecast.date
        weatherIcon.image = UIImage(named: forecast.weatherType)
    }
    
}
