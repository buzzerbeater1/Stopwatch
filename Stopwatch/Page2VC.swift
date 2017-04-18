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
        
        if setup.fr != nil {
            print("We have a wheel in the page 2 view controller")
            fr = setup.fr as? Wheel
            updateLabels()
        }else{
            print("no wheel in page 2")
            fr = Wheel()
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
        //        subview.image = UIImage(named: "fr")
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
    
}
