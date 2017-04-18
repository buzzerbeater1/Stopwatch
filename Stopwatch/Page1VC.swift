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

        if setup.fl != nil {
            print("We have a wheel in the page 1 view controller")
            fl = setup.fl as? Wheel
            updateLabels()
        }else{
            print("no wheel in page 1")
            fl = Wheel()
        }
        
//        let scrollView = UIScrollView(frame: super.view.bounds)
//        
//        
//        scrollView.delegate = self
//        scrollView.backgroundColor = UIColor.black
//        let contentWidth = scrollView.bounds.width
//        let contentHeight = scrollView.bounds.height*1.2
//        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
//        let frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
//        let subview = UIImageView(frame: frame)
//        subview.image = UIImage(named: "FL")
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

}
