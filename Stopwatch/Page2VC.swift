//
//  Page2VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page2VC: UIViewController {
    
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
    
    // Constrain Outlets
    @IBOutlet weak var stackViewWidth: NSLayoutConstraint!
    @IBOutlet weak var stackViewLeading: NSLayoutConstraint!
    @IBOutlet weak var stackViewTop: NSLayoutConstraint!
    @IBOutlet weak var stackViewBottom: NSLayoutConstraint!
    
    func saveButtonPressed() {
        let frNew = Wheel()
        frNew.rideHeight.value = rideHeightTextField.text!
        frNew.trackPlate.value = trackPlateTextField.text!
        frNew.spring.pre.value = preSpringTextField.text!
        frNew.damper.lb.value = lbTextField.text!
        frNew.damper.lr.value = lrTextField.text!
        frNew.damper.hb.value = hbTextField.text!
        frNew.damper.hr.value = hrTextField.text!
        frNew.arb.position.value = posTextField.text!
        frNew.arb.pre.value = preARBTextField.text!
        frNew.camber.value = camberTextField.text!
        frNew.toe.value = toeTextField.text!
        frNew.coldPressure.value = coldPressureTextField.text!
        frNew.hotPressure.value = hotPressuretTextField.text!
        
        setup.fr = frNew
    }
    
    var fr: Wheel!
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
        rideHeightTextField.text = fr.rideHeight.value
        trackPlateTextField.text = fr.trackPlate.value
        preSpringTextField.text = fr.spring.pre.value
        lbTextField.text = fr.damper.lb.value
        lrTextField.text = fr.damper.lr.value
        hbTextField.text = fr.damper.hb.value
        hrTextField.text = fr.damper.hr.value
        posTextField.text = fr.arb.position.value
        preARBTextField.text = fr.arb.pre.value
        camberTextField.text = fr.camber.value
        toeTextField.text = fr.toe.value
        coldPressureTextField.text = fr.coldPressure.value
        hotPressuretTextField.text = fr.hotPressure.value
    }
    
    func getWheel() {
        if setup.fr != nil {
            print("We have a wheel in the page 2 view controller")
            fr = setup.fr as? Wheel
            
        }else{
            print("no wheel in page 2")
            fr = Wheel()
            
        }
        updateLabels()
    }
}
