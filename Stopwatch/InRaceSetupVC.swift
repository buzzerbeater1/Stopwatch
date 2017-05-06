//
//  InRaceSetupVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/21/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class InRaceSetupVC: UIViewController, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var expandedView: UIView!
    
    @IBAction func testButtonPressed(_ sender: UIButton) {
//        performSegue(withIdentifier: "InRaceSetupDetailsVC", sender: nil)
    }
    
    @IBAction func toggleButtonPressed(_ sender: UIButton) {
        if expandedView.isHidden {
            expandedView.isHidden = false
        } else {
            expandedView.isHidden = true
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    var obj = [UIViewController]()
    var numberOfSubPages = 20
    var car: Car!
    var setup: Setup!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       imagePicker = UIImagePickerController()
 //       imagePicker.delegate = self
    

        
        containerScrollView.delegate = self
        self.containerScrollView.decelerationRate = UIScrollViewDecelerationRateFast
        self.containerScrollView.contentSize = CGSize(width: numberOfSubPages*100, height: 500)
        
        var x = 0

        
        repeat {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InRaceSubPagesVC") as! InRaceSubPagesVC
            vc.x = x
            obj.append(vc)
            self.containerScrollView.addSubview(obj[x].view)
            obj[x].willMove(toParentViewController: self)
            self.addChildViewController(obj[x])
            obj[x].view.frame.origin =  CGPoint(x: (CGFloat(x))*100, y: 0)
            x += 1
            print("\(x) sucessfully initialized")
        } while (x < numberOfSubPages)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InRaceSetupDetailsVC" {
            if let controller = segue.destination as? InRaceSetupDetailsVC {
                controller.presentationController?.delegate = self
                controller.modalPresentationStyle = .overCurrentContext
                controller.view.superview?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
                controller.view.superview?.center = self.view.center
            }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth = Float(100)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        testLabel.text = car.name
    }

}
