//
//  SetupCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 27/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupCell: UITableViewCell {

    var singleFieldLeft: UILabel!
    var singleFieldRight: UILabel!
    var tirePressureFLLabel: UILabel!
    var tirePressureFRLabel: UILabel!
    var tirePressureRLLabel: UILabel!
    var tirePressureRRLabel: UILabel!
    var tireTemperatureFLOoutLabel: UILabel!
    var tireTemperatureFLMidLabel: UILabel!
    var tireTemperatureFLInLabel: UILabel!
    var tireTemperatureFROoutLabel: UILabel!
    var tireTemperatureFRMidLabel: UILabel!
    var tireTemperatureFRInLabel: UILabel!
    var tireTemperatureRLOoutLabel: UILabel!
    var tireTemperatureRLMidLabel: UILabel!
    var tireTemperatureRLInLabel: UILabel!
    var tireTemperatureRROoutLabel: UILabel!
    var tireTemperatureRRMidLabel: UILabel!
    var tireTemperatureRRInLabel: UILabel!
    var needLayout = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        singleFieldLeft = UILabel()
        singleFieldRight = UILabel()
        tirePressureFLLabel = UILabel()
        tirePressureFRLabel = UILabel()
        tirePressureRLLabel = UILabel()
        tirePressureRRLabel = UILabel()
        tireTemperatureFLOoutLabel = UILabel()
        tireTemperatureFLMidLabel = UILabel()
        tireTemperatureFLInLabel = UILabel()
        tireTemperatureFROoutLabel = UILabel()
        tireTemperatureFRMidLabel = UILabel()
        tireTemperatureFRInLabel = UILabel()
        tireTemperatureRLOoutLabel = UILabel()
        tireTemperatureRLMidLabel = UILabel()
        tireTemperatureRLInLabel = UILabel()
        tireTemperatureRROoutLabel = UILabel()
        tireTemperatureRRMidLabel = UILabel()
        tireTemperatureRRInLabel = UILabel()
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
        singleFieldLeft = UILabel(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        singleFieldLeft.textAlignment = .center
        singleFieldRight = UILabel(frame: CGRect(x: 55, y: 5, width: 40, height: 40))
        singleFieldRight.textAlignment = .center
        if row == 0 {
            tirePressureFLLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 40, height: 15))
            tirePressureFLLabel.textAlignment = .center
            tirePressureFRLabel = UILabel(frame: CGRect(x: 55, y: 5, width: 40, height: 15))
            tirePressureFRLabel.textAlignment = .center
            tirePressureRLLabel = UILabel(frame: CGRect(x: 5, y: 30, width: 40, height: 15))
            tirePressureRLLabel.textAlignment = .center
            tirePressureRRLabel = UILabel(frame: CGRect(x: 55, y: 30, width: 40, height: 15))
            tirePressureRRLabel.textAlignment = .center
            self.addSubview(verticalBar)
            self.addSubview(horizontalBar)
            self.addSubview(tirePressureFLLabel)
            self.addSubview(tirePressureFRLabel)
            self.addSubview(tirePressureRLLabel)
            self.addSubview(tirePressureRRLabel)           
        } else if row == 1 {
            tireTemperatureFLOoutLabel = UILabel(frame: CGRect(x: 4, y: 5, width: 12, height: 15))
            tireTemperatureFLMidLabel = UILabel(frame: CGRect(x: 19, y: 5, width: 12, height: 15))
            tireTemperatureFLInLabel = UILabel(frame: CGRect(x: 34, y: 5, width: 12, height: 15))
            tireTemperatureFROoutLabel = UILabel(frame: CGRect(x: 84, y: 5, width: 12, height: 15))
            tireTemperatureFRMidLabel = UILabel(frame: CGRect(x: 69, y: 5, width: 12, height: 15))
            tireTemperatureFRInLabel = UILabel(frame: CGRect(x: 54, y: 5, width: 12, height: 15))
            tireTemperatureRLOoutLabel = UILabel(frame: CGRect(x: 4, y: 30, width: 12, height: 15))
            tireTemperatureRLMidLabel = UILabel(frame: CGRect(x: 19, y: 30, width: 12, height: 15))
            tireTemperatureRLInLabel = UILabel(frame: CGRect(x: 34, y: 30, width: 12, height: 15))
            tireTemperatureRROoutLabel = UILabel(frame: CGRect(x: 84, y: 30, width: 12, height: 15))
            tireTemperatureRRMidLabel = UILabel(frame: CGRect(x: 69, y: 30, width: 12, height: 15))
            tireTemperatureRRInLabel = UILabel(frame: CGRect(x: 54, y: 30, width: 12, height: 15))
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
        } else {
            self.addSubview(verticalBar)
            self.addSubview(singleFieldLeft)
            self.addSubview(singleFieldRight)
        }
        needLayout = false      
    }
    
    func updateValues(_ row: Int, with setup: SetupRun) {
        if row == 0 {
            tirePressureRRLabel.text = setup.tirePressureRR
            tirePressureRLLabel.text = setup.tirePressureRL
            tirePressureFRLabel.text = setup.tirePressureFR
            tirePressureFLLabel.text = setup.tirePressureFL
        } else if row == 1 {
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
        } else if row == 2 {
            singleFieldLeft.text = setup.fuel
        } else if row == 3 {
            singleFieldLeft.text = setup.airTemp
            singleFieldRight.text = setup.trackTemp
        }
        
    }
}
