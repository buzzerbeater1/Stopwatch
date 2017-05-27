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
        //        let scrollView = UIScrollView(rlame: super.view.bounds)
        //
        //
        //        scrollView.delegate = self
        //        scrollView.backgroundColor = UIColor.black
        //        let contentWidth = scrollView.bounds.width
        //        let contentHeight = scrollView.bounds.height*1.2
        //        scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        //        let rlame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        //        let subview = UIImageView(rlame: rlame)
        //        subview.image = UIImage(named: "rl")
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
            print("We have a wheel in the page 2 view controller")
            rl = setup.rl as? Wheel
            
        }else{
            print("no wheel in page 2")
            rl = Wheel()
        }
        updateLabels()
    }
    
}
