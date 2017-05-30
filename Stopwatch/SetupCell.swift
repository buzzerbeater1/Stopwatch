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
    var tireTemperatureFLOutLabel: UILabel!
    var tireTemperatureFLMidLabel: UILabel!
    var tireTemperatureFLInLabel: UILabel!
    var tireTemperatureFROutLabel: UILabel!
    var tireTemperatureFRMidLabel: UILabel!
    var tireTemperatureFRInLabel: UILabel!
    var tireTemperatureRLOutLabel: UILabel!
    var tireTemperatureRLMidLabel: UILabel!
    var tireTemperatureRLInLabel: UILabel!
    var tireTemperatureRROutLabel: UILabel!
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
        tireTemperatureFLOutLabel = UILabel()
        tireTemperatureFLMidLabel = UILabel()
        tireTemperatureFLInLabel = UILabel()
        tireTemperatureFROutLabel = UILabel()
        tireTemperatureFRMidLabel = UILabel()
        tireTemperatureFRInLabel = UILabel()
        tireTemperatureRLOutLabel = UILabel()
        tireTemperatureRLMidLabel = UILabel()
        tireTemperatureRLInLabel = UILabel()
        tireTemperatureRROutLabel = UILabel()
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
            tireTemperatureFLOutLabel = UILabel(frame: CGRect(x: 4, y: 5, width: 12, height: 15))
            tireTemperatureFLMidLabel = UILabel(frame: CGRect(x: 19, y: 5, width: 12, height: 15))
            tireTemperatureFLInLabel = UILabel(frame: CGRect(x: 34, y: 5, width: 12, height: 15))
            tireTemperatureFROutLabel = UILabel(frame: CGRect(x: 84, y: 5, width: 12, height: 15))
            tireTemperatureFRMidLabel = UILabel(frame: CGRect(x: 69, y: 5, width: 12, height: 15))
            tireTemperatureFRInLabel = UILabel(frame: CGRect(x: 54, y: 5, width: 12, height: 15))
            tireTemperatureRLOutLabel = UILabel(frame: CGRect(x: 4, y: 30, width: 12, height: 15))
            tireTemperatureRLMidLabel = UILabel(frame: CGRect(x: 19, y: 30, width: 12, height: 15))
            tireTemperatureRLInLabel = UILabel(frame: CGRect(x: 34, y: 30, width: 12, height: 15))
            tireTemperatureRROutLabel = UILabel(frame: CGRect(x: 84, y: 30, width: 12, height: 15))
            tireTemperatureRRMidLabel = UILabel(frame: CGRect(x: 69, y: 30, width: 12, height: 15))
            tireTemperatureRRInLabel = UILabel(frame: CGRect(x: 54, y: 30, width: 12, height: 15))
            self.addSubview(tireTemperatureFLInLabel)
            self.addSubview(tireTemperatureFLOutLabel)
            self.addSubview(tireTemperatureFLMidLabel)
            self.addSubview(tireTemperatureFRInLabel)
            self.addSubview(tireTemperatureFROutLabel)
            self.addSubview(tireTemperatureFRMidLabel)
            self.addSubview(tireTemperatureRLInLabel)
            self.addSubview(tireTemperatureRLOutLabel)
            self.addSubview(tireTemperatureRLMidLabel)
            self.addSubview(tireTemperatureRRInLabel)
            self.addSubview(tireTemperatureRROutLabel)
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
            print("HELLO HELLO HELLO HELLO ")
 //           let divisorFL = (2*((Double(setup.tireTemperatureFLMid ?? "50") + Double(setup.tireTemperatureFLIn ?? "50") + Double(setup.tireTemperatureFLOut ?? "50")) / 3))
            tireTemperatureFLMidLabel.text = setup.tireTemperatureFLMid
  //          tireTemperatureFLMidLabel.backgroundColor = UIColor(hue: Double(setup.tireTemperatureFLMid ?? "50")/divisorFL, saturation: 1, brightness: 1, alpha: 1)   //(red: CGFloat(Double(setup.tireTemperatureFLMid ?? "50")!)/divisorFL, green: (1 - CGFloat(Double(setup.tireTemperatureFLMid ?? "50")!)/divisorFL), blue: 0, alpha: 1)
            tireTemperatureFLOutLabel.text = setup.tireTemperatureFLOut
 //           tireTemperatureFLOutLabel.backgroundColor = UIColor(hue: Double(setup.tireTemperatureFLOut ?? "50")/divisorFL, saturation: 1, brightness: 1, alpha: 1)   //red: CGFloat(Double(setup.tireTemperatureFLOut ?? "50")!)/divisorFL, green: (1 - CGFloat(Double(setup.tireTemperatureFLOut ?? "50")!)/divisorFL), blue: 0, alpha: 1)
            tireTemperatureFLInLabel.text = setup.tireTemperatureFLIn
  //          tireTemperatureFLInLabel.backgroundColor = UIColor(hue: Double(setup.tireTemperatureFLIn ?? "50")/divisorFL, saturation: 1, brightness: 1, alpha: 1)  //red: CGFloat(Double(setup.tireTemperatureFLIn ?? "50")!)/divisorFL, green: (1 - CGFloat(Double(setup.tireTemperatureFLIn ?? "50")!)/divisorFL), blue: 0, alpha: 1)
            tireTemperatureFRMidLabel.text = setup.tireTemperatureFRMid
            tireTemperatureFROutLabel.text = setup.tireTemperatureFROut
            tireTemperatureFRInLabel.text = setup.tireTemperatureFRIn
            tireTemperatureRLMidLabel.text = setup.tireTemperatureRLMid
            tireTemperatureRLOutLabel.text = setup.tireTemperatureRLOut
            tireTemperatureRLInLabel.text = setup.tireTemperatureRLIn
            tireTemperatureRRMidLabel.text = setup.tireTemperatureRRMid
            tireTemperatureRROutLabel.text = setup.tireTemperatureRROut
            tireTemperatureRRInLabel.text = setup.tireTemperatureRRIn
        } else if row == 2 {
            singleFieldLeft.text = setup.fuel
        } else if row == 3 {
            singleFieldLeft.text = setup.airTemp
            singleFieldRight.text = setup.trackTemp
        }
        
    }
}
