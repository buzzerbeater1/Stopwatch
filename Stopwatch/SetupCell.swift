//
//  SetupCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 27/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func createLayout(_ row: Int, dataFrom setup: SetupRun) {
        let horizontalBar = UIView(frame: CGRect(x: 4, y: 24, width: 92, height: 2))
        horizontalBar.backgroundColor = .black
        let verticalBar = UIView(frame: CGRect(x: 49, y: 0, width: 2, height: 50))
        verticalBar.backgroundColor = .black
        let singleFieldLeft = UILabel(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        singleFieldLeft.textAlignment = .center
        let singleFieldRight = UILabel(frame: CGRect(x: 55, y: 5, width: 40, height: 40))
        singleFieldRight.textAlignment = .center
        if row == 0 {
            let tirePressureFLLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 40, height: 15))
            tirePressureFLLabel.textAlignment = .center
            let tirePressureFRLabel = UILabel(frame: CGRect(x: 55, y: 5, width: 40, height: 15))
            tirePressureFRLabel.textAlignment = .center
            let tirePressureRLLabel = UILabel(frame: CGRect(x: 5, y: 30, width: 40, height: 15))
            tirePressureRLLabel.textAlignment = .center
            let tirePressureRRLabel = UILabel(frame: CGRect(x: 55, y: 30, width: 40, height: 15))
            tirePressureRRLabel.textAlignment = .center
            self.addSubview(verticalBar)
            self.addSubview(horizontalBar)
            self.addSubview(tirePressureFLLabel)
            self.addSubview(tirePressureFRLabel)
            self.addSubview(tirePressureRLLabel)
            self.addSubview(tirePressureRRLabel)
            tirePressureRRLabel.text = setup.tirePressureRR
            tirePressureRLLabel.text = setup.tirePressureRL
            tirePressureFRLabel.text = setup.tirePressureFR
            tirePressureFLLabel.text = setup.tirePressureFL
        } else if row == 1 {
            let tireTemperatureFLOoutLabel = UILabel(frame: CGRect(x: 4, y: 5, width: 12, height: 15))
            let tireTemperatureFLMidLabel = UILabel(frame: CGRect(x: 19, y: 5, width: 12, height: 15))
            let tireTemperatureFLInLabel = UILabel(frame: CGRect(x: 34, y: 5, width: 12, height: 15))
            let tireTemperatureFROoutLabel = UILabel(frame: CGRect(x: 54, y: 5, width: 12, height: 15))
            let tireTemperatureFRMidLabel = UILabel(frame: CGRect(x: 69, y: 5, width: 12, height: 15))
            let tireTemperatureFRInLabel = UILabel(frame: CGRect(x: 84, y: 5, width: 12, height: 15))
            let tireTemperatureRLOoutLabel = UILabel(frame: CGRect(x: 4, y: 30, width: 12, height: 15))
            let tireTemperatureRLMidLabel = UILabel(frame: CGRect(x: 19, y: 30, width: 12, height: 15))
            let tireTemperatureRLInLabel = UILabel(frame: CGRect(x: 34, y: 30, width: 12, height: 15))
            let tireTemperatureRROoutLabel = UILabel(frame: CGRect(x: 54, y: 30, width: 12, height: 15))
            let tireTemperatureRRMidLabel = UILabel(frame: CGRect(x: 69, y: 30, width: 12, height: 15))
            let tireTemperatureRRInLabel = UILabel(frame: CGRect(x: 84, y: 30, width: 12, height: 15))
            self.addSubview(tireTemperatureFLInLabel)
            self.addSubview(tireTemperatureFLOoutLabel)
            self.addSubview(tireTemperatureFLMidLabel)
            self.addSubview(tireTemperatureFRInLabel)
            self.addSubview(tireTemperatureFROoutLabel)
            self.addSubview(tireTemperatureFRMidLabel)
            self.addSubview(tireTemperatureRLInLabel)
            self.addSubview(tireTemperatureRLOoutLabel)
            self.addSubview(tireTemperatureRLMidLabel)
            self.addSubview(tireTemperatureRRInLabel)
            self.addSubview(tireTemperatureRROoutLabel)
            self.addSubview(tireTemperatureRRMidLabel)
            self.addSubview(horizontalBar)
            self.addSubview(verticalBar)
            tireTemperatureFLMidLabel.text = setup.tireTemperatureFLMid
            tireTemperatureFLOoutLabel.text = setup.tireTemperatureFLOut
            tireTemperatureFLInLabel.text = setup.tireTemperatureFLIn
            tireTemperatureFRMidLabel.text = setup.tireTemperatureFRMid
            tireTemperatureFROoutLabel.text = setup.tireTemperatureFROut
            tireTemperatureFRInLabel.text = setup.tireTemperatureFRIn
            tireTemperatureRLMidLabel.text = setup.tireTemperatureRLMid
            tireTemperatureRLOoutLabel.text = setup.tireTemperatureRLOut
            tireTemperatureRLInLabel.text = setup.tireTemperatureRLIn
            tireTemperatureRRMidLabel.text = setup.tireTemperatureRRMid
            tireTemperatureRROoutLabel.text = setup.tireTemperatureRROut
            tireTemperatureRRInLabel.text = setup.tireTemperatureRRIn
        } else {
            self.addSubview(verticalBar)
            self.addSubview(singleFieldLeft)
            self.addSubview(singleFieldRight)
            if row == 2 {
                singleFieldLeft.text = setup.fuel
            } else if row == 3 {
                singleFieldLeft.text = setup.airTemp
                singleFieldRight.text = setup.trackTemp
            }
        }
    }
}
