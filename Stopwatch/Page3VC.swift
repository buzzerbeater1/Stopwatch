//
//  Page3VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page3VC: UIViewController {
    
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
        let rlNew = Wheel()
        rlNew.rideHeight.value = rideHeightTextField.text!
        rlNew.trackPlate.value = trackPlateTextField.text!
        rlNew.spring.pre.value = preSpringTextField.text!
        rlNew.damper.lb.value = lbTextField.text!
        rlNew.damper.lr.value = lrTextField.text!
        rlNew.damper.hb.value = hbTextField.text!
        rlNew.damper.hr.value = hrTextField.text!
        rlNew.arb.position.value = posTextField.text!
        rlNew.arb.pre.value = preARBTextField.text!
        rlNew.camber.value = camberTextField.text!
        rlNew.toe.value = toeTextField.text!
        rlNew.coldPressure.value = coldPressureTextField.text!
        rlNew.hotPressure.value = hotPressuretTextField.text!
        
        setup.rl = rlNew
    }
    
    var rl: Wheel!
    var setup: Setup!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWheel()
        
        scrollView.contentSize = CGSize(width: super.view.frame.width, height: super.view.frame.width * (741/375))
        scrollView.frame = super.view.bounds
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateLabels() {
        rideHeightTextField.text = rl.rideHeight.value
        trackPlateTextField.text = rl.trackPlate.value
        preSpringTextField.text = rl.spring.pre.value
        lbTextField.text = rl.damper.lb.value
        lrTextField.text = rl.damper.lr.value
        hbTextField.text = rl.damper.hb.value
        hrTextField.text = rl.damper.hr.value
        posTextField.text = rl.arb.position.value
        preARBTextField.text = rl.arb.pre.value
        camberTextField.text = rl.camber.value
        toeTextField.text = rl.toe.value
        coldPressureTextField.text = rl.coldPressure.value
        hotPressuretTextField.text = rl.hotPressure.value
    }
    
    func getWheel() {
        if setup.rl != nil {
            rl = setup.rl as? Wheel
        }else{
            rl = Wheel()
        }
        updateLabels()
    }
    
}
