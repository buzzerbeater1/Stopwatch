//
//  SetupScrollVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupScrollVC: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBAction func segmentChange(_ sender: Any) {
        containerScrollView.setContentOffset(CGPoint.init(x: segmentControl.selectedSegmentIndex*375, y: 0), animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        containerScrollView.delegate = self
        
        self.containerScrollView.contentSize = CGSize(width: CGFloat(segmentControl.numberOfSegments)*UIScreen.main.bounds.width, height: 495)
        
        var x = 0
        var obj = [UIViewController]()
        
        repeat {
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "Page\(x+1)VC"))!
            obj.append(vc)
            self.containerScrollView.addSubview(obj[x].view)
            obj[x].willMove(toParentViewController: self)
            self.addChildViewController(obj[x])
            obj[x].view.frame.origin =  CGPoint(x: (CGFloat(x))*UIScreen.main.bounds.width, y: 0)
            x += 1
            print("Page \(x) sucessfully initialized")
        } while (x < segmentControl.numberOfSegments)
//        
//        let obj1 = self.storyboard?.instantiateViewController(withIdentifier: "Page1VC") as! Page1VC
//        let obj2 = self.storyboard?.instantiateViewController(withIdentifier: "Page2VC") as! Page2VC
//        let obj3 = self.storyboard?.instantiateViewController(withIdentifier: "Page3VC") as! Page3VC
//        let obj4 = self.storyboard?.instantiateViewController(withIdentifier: "Page4VC") as! Page4VC
//        let obj5 = self.storyboard?.instantiateViewController(withIdentifier: "Page5VC") as! Page5VC
//        
//        self.containerScrollView.addSubview(obj2.view)
//        obj2.willMove(toParentViewController: self)
//        self.addChildViewController(obj2)
//        
//        self.containerScrollView.addSubview(obj1.view)
//        obj1.willMove(toParentViewController: self)
//        self.addChildViewController(obj1)
//        
//        self.containerScrollView.addSubview(obj3.view)
//        obj3.willMove(toParentViewController: self)
//        self.addChildViewController(obj3)
//        
//        self.containerScrollView.addSubview(obj4.view)
//        obj4.willMove(toParentViewController: self)
//        self.addChildViewController(obj4)
//        
//        self.containerScrollView.addSubview(obj5.view)
//        obj5.willMove(toParentViewController: self)
//        self.addChildViewController(obj5)
//        
//        obj1.view.frame.origin =  CGPoint.init(x: 0, y: 0)
//        obj2.view.frame.origin =  CGPoint.init(x: UIScreen.main.bounds.width, y: 0)
//        obj3.view.frame.origin = CGPoint.init(x: 2*UIScreen.main.bounds.width, y: 0)
        
        self.containerScrollView.frame = obj[2].view.frame

        // Do any additional setup after loading the view.
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        segmentControl.selectedSegmentIndex = (Int(containerScrollView.contentOffset.x)+(375/2))/375
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
