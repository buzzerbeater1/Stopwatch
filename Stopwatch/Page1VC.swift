//
//  Page1VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page1VC: UIViewController {

    @IBOutlet weak var rideHeightTextField: UITextField!
    @IBOutlet weak var trackPlateTextField: UITextField!
    @IBOutlet weak var preSpringTextField: UITextField!
    @IBOutlet weak var lbTextField: UITextField!
    @IBOutlet weak var lrTextField: UITextField!
    @IBOutlet weak var hbTextField: UITextField!
    @IBOutlet weak var hrTextField: UITextField!
    @IBOutlet weak var posTextField: UITextField!
    @IBOutlet weak var preARBTextField: UITextField!
    @IBOutlet weak var camberTextField: UITextField!
    @IBOutlet weak var toeTextField: UITextField!
    @IBOutlet weak var coldPressureTextField: UITextField!
    @IBOutlet weak var hotPressuretTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackViewTextFields: UIStackView!
    
    //Constrain Outlets
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var stackViewLeading: NSLayoutConstraint!
    @IBOutlet weak var stackViewTop: NSLayoutConstraint!
    @IBOutlet weak var stackViewBottom: NSLayoutConstraint!
    
    
    func saveButtonPressed() {
        let flNew = Wheel()
        flNew.rideHeight.value = rideHeightTextField.text!
        flNew.trackPlate.value = trackPlateTextField.text!
        flNew.spring.pre.value = preSpringTextField.text!
        flNew.damper.lb.value = lbTextField.text!
        flNew.damper.lr.value = lrTextField.text!
        flNew.damper.hb.value = hbTextField.text!
        flNew.damper.hr.value = hrTextField.text!
        flNew.arb.position.value = posTextField.text!
        flNew.arb.pre.value = preARBTextField.text!
        flNew.camber.value = camberTextField.text!
        flNew.toe.value = toeTextField.text!
        flNew.coldPressure.value = coldPressureTextField.text!
        flNew.hotPressure.value = hotPressuretTextField.text!
        setup.fl = flNew
    }
    
    var fl: Wheel!
    var setup: Setup!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getWheel()
        
        scrollView.contentSize = CGSize(width: super.view.frame.width, height: super.view.frame.width * (732/375))
        scrollView.frame = super.view.bounds
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateLabels() {
        rideHeightTextField.text = fl.rideHeight.value
        trackPlateTextField.text = fl.trackPlate.value
        preSpringTextField.text = fl.spring.pre.value
        lbTextField.text = fl.damper.lb.value
        lrTextField.text = fl.damper.lr.value
        hbTextField.text = fl.damper.hb.value
        hrTextField.text = fl.damper.hr.value
        posTextField.text = fl.arb.position.value
        preARBTextField.text = fl.arb.pre.value
        camberTextField.text = fl.camber.value
        toeTextField.text = fl.toe.value
        coldPressureTextField.text = fl.coldPressure.value
        hotPressuretTextField.text = fl.hotPressure.value
    }
    
    func getWheel() {
        if setup.fl != nil {
            fl = setup.fl as? Wheel
        }else{
            fl = Wheel()
        }
        updateLabels()
    }
}
