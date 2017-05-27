//
//  Page4VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/6/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page4VC: UIViewController {
    
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
        let rrNew = Wheel()
        rrNew.rideHeight.value = rideHeightTextField.text!
        rrNew.trackPlate.value = trackPlateTextField.text!
        rrNew.spring.pre.value = preSpringTextField.text!
        rrNew.damper.lb.value = lbTextField.text!
        rrNew.damper.lr.value = lrTextField.text!
        rrNew.damper.hb.value = hbTextField.text!
        rrNew.damper.hr.value = hrTextField.text!
        rrNew.arb.position.value = posTextField.text!
        rrNew.arb.pre.value = preARBTextField.text!
        rrNew.camber.value = camberTextField.text!
        rrNew.toe.value = toeTextField.text!
        rrNew.coldPressure.value = coldPressureTextField.text!
        rrNew.hotPressure.value = hotPressuretTextField.text!
        
        
        
        setup.rr = rrNew
    }
    
    var rr: Wheel!
    var setup: Setup!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getWheel()
        
        
        scrollView.contentSize = CGSize(width: super.view.frame.width, height: super.view.frame.width * (732/375))
        scrollView.frame = super.view.bounds
        //        let scrollView = UIScrollView(rrame: super.view.bounds)
        //
        //
        //        scrollView.delegate = self
        //        scrollView.backgroundColor = UIColor.black
        //        let contentWidth = scrollView.bounds.width
        //        let contentHeight = scrollView.bounds.height*1.2
        //        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        //        let rrame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        //        let subview = UIImageView(rrame: rrame)
        //        subview.image = UIImage(named: "rr")
        //        subview.contentMode = .scaleAspectFit
        //        super.view.addSubview(scrollView)
        //        scrollView.addSubview(subview)
        
        
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
    
    func updateLabels() {
        rideHeightTextField.text = rr.rideHeight.value
        trackPlateTextField.text = rr.trackPlate.value
        preSpringTextField.text = rr.spring.pre.value
        lbTextField.text = rr.damper.lb.value
        lrTextField.text = rr.damper.lr.value
        hbTextField.text = rr.damper.hb.value
        hrTextField.text = rr.damper.hr.value
        posTextField.text = rr.arb.position.value
        preARBTextField.text = rr.arb.pre.value
        camberTextField.text = rr.camber.value
        toeTextField.text = rr.toe.value
        coldPressureTextField.text = rr.coldPressure.value
        hotPressuretTextField.text = rr.hotPressure.value
    }
    
    func getWheel() {
        if setup.rr != nil {
            print("We have a wheel in the page 4 view controller")
            rr = setup.rr as? Wheel
            
        }else{
            print("no wheel in page 4")
            rr = Wheel()
        }
        updateLabels()
    }
    
    
}
