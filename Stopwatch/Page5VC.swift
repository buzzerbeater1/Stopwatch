//
//  Page5VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/6/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page5VC: UIViewController {
    
    @IBOutlet weak var brakeBiasFLTextfield: UITextField!
    @IBOutlet weak var brakeBiasFrontTextfield: UITextField!
    @IBOutlet weak var brakeBiasFRTextfield: UITextField!
    @IBOutlet weak var brakeBiasFRCrossRLTextfield: UITextField!
    @IBOutlet weak var brakeBiasFLCrossRRTextfield: UITextField!
    @IBOutlet weak var brakeBiasRLTextfield: UITextField!
    @IBOutlet weak var brakeBiasRearTextfield: UITextField!
    @IBOutlet weak var brakeBiasRRTextfield: UITextField!
    @IBOutlet weak var rearWingPosTextfield: UITextField!
    @IBOutlet weak var gearRatioFirstTextfield: UITextField!
    @IBOutlet weak var gearRatioSecondTextfield: UITextField!
    @IBOutlet weak var gearRatioThirdTextfield: UITextField!
    @IBOutlet weak var gearRatioFourthTextfield: UITextField!
    @IBOutlet weak var gearRatioFifthTextfield: UITextField!
    @IBOutlet weak var gearRatioSixthTextfield: UITextField!
    @IBOutlet weak var gearRatioReverseTextfield: UITextField!
    @IBOutlet weak var gearRatioFinalTextfield: UITextField!
    @IBOutlet weak var fuelConsumptionTextfield: UITextField!
    @IBOutlet weak var fuelLoadedTextfield: UITextField!
    @IBOutlet weak var rampAngleAcceTextfield: UITextField!
    @IBOutlet weak var rampAngleCoastTextfield: UITextField!
    @IBOutlet weak var frictionPadPreTextfield: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var constraintsCollection: [NSLayoutConstraint]!
    
    
    func saveButtonPressed() {
        let generalNew = General()
        generalNew.brake.brakeFL.value = brakeBiasFLTextfield.text!
        generalNew.brake.brakeFR.value = brakeBiasFRTextfield.text!
        generalNew.brake.brakeRL.value = brakeBiasRLTextfield.text!
        generalNew.brake.brakeRR.value = brakeBiasRRTextfield.text!
        generalNew.brake.front.value = brakeBiasFrontTextfield.text!
        generalNew.brake.rear.value = brakeBiasRearTextfield.text!
// Cross missing
//
        generalNew.rearAero.rearWingPos.value = rearWingPosTextfield.text!
        generalNew.gearbox.gearRatio.firstGear.value = gearRatioFirstTextfield.text!
        generalNew.gearbox.gearRatio.secondGear.value = gearRatioSecondTextfield.text!
        generalNew.gearbox.gearRatio.thirdGear.value = gearRatioThirdTextfield.text!
        generalNew.gearbox.gearRatio.fourthGear.value = gearRatioFourthTextfield.text!
        generalNew.gearbox.gearRatio.fifthGear.value = gearRatioFifthTextfield.text!
        generalNew.gearbox.gearRatio.sixthGear.value = gearRatioSixthTextfield.text!
        generalNew.gearbox.gearRatio.reverse.value = gearRatioReverseTextfield.text!
        generalNew.gearbox.gearRatio.final.value = gearRatioFinalTextfield.text!
        generalNew.fuel.consumption.value = fuelConsumptionTextfield.text!
        generalNew.fuel.loaded.value = fuelLoadedTextfield.text!
        generalNew.differential.rampAngle.acceleration.value = rampAngleAcceTextfield.text!
        generalNew.differential.rampAngle.coast.value = rampAngleCoastTextfield.text!
        generalNew.differential.frictionPad.value = frictionPadPreTextfield.text!
        
        
        setup.general = generalNew
    }
    
    var general: General!
    var setup: Setup!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWheel()
    
        scrollView.contentSize = CGSize(width: 375, height: 375 * (846/375))
        scrollView.frame = super.view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
          brakeBiasFLTextfield.text! = general.brake.brakeFL.value
          brakeBiasFRTextfield.text! = general.brake.brakeFR.value
          brakeBiasRLTextfield.text! = general.brake.brakeRL.value
          brakeBiasRRTextfield.text! = general.brake.brakeRR.value
          brakeBiasFrontTextfield.text! = general.brake.front.value
          brakeBiasRearTextfield.text! = general.brake.rear.value
            // Cross missing
            //
          rearWingPosTextfield.text! = general.rearAero.rearWingPos.value
          gearRatioFirstTextfield.text! = general.gearbox.gearRatio.firstGear.value
          gearRatioSecondTextfield.text! = general.gearbox.gearRatio.secondGear.value
          gearRatioThirdTextfield.text! = general.gearbox.gearRatio.thirdGear.value
          gearRatioFourthTextfield.text! = general.gearbox.gearRatio.fourthGear.value
          gearRatioFifthTextfield.text! = general.gearbox.gearRatio.fifthGear.value
          gearRatioSixthTextfield.text! = general.gearbox.gearRatio.sixthGear.value
          gearRatioReverseTextfield.text! = general.gearbox.gearRatio.reverse.value
          gearRatioFinalTextfield.text! = general.gearbox.gearRatio.final.value
          fuelConsumptionTextfield.text! = general.fuel.consumption.value
          fuelLoadedTextfield.text! = general.fuel.loaded.value
          rampAngleAcceTextfield.text! = general.differential.rampAngle.acceleration.value
          rampAngleCoastTextfield.text! = general.differential.rampAngle.coast.value
          frictionPadPreTextfield.text! = general.differential.frictionPad.value
    }
    
    func getWheel() {
        if setup.general != nil {
            general = setup.general as? General
        }else{
            general = General()
        }
        updateLabels()
    }
    
}
