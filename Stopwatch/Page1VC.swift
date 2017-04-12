//
//  Page1VC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class Page1VC: UIViewController, UIScrollViewDelegate {

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
    
    var fl: Wheel!
    var setup: Setup!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if setup != nil {
            print("We have a setup in the page 1 view controller")
        }else{
            print("no setup in page 1")
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

}
