//
//  SetupScrollVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupScrollVC: UIViewControllerStatusBar, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var notesStackView: UIStackView!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        let page1VC = self.childViewControllers[0] as! Page1VC
        page1VC.saveButtonPressed()
        let page2VC = self.childViewControllers[1] as! Page2VC
        page2VC.saveButtonPressed()
        let page3VC = self.childViewControllers[2] as! Page3VC
        page3VC.saveButtonPressed()
        let page4VC = self.childViewControllers[3] as! Page4VC
        page4VC.saveButtonPressed()
        let page5VC = self.childViewControllers[4] as! Page5VC
        page5VC.saveButtonPressed()
        
        
        ad.saveContext()
    }
    
    @IBAction func segmentChange(_ sender: Any) {
        containerScrollView.setContentOffset(CGPoint(x: segmentControl.selectedSegmentIndex*375, y: 0), animated: true)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pictureButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    @IBAction func voiceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "VoiceNoteVC", sender: car)
    }
    
    @IBAction func writeButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "WrittenNoteVC", sender: car)
    }
    
    
    var setup: Setup!
    var car: Car!
    var obj = [UIViewController]()
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if car != nil {
            print("I guess we have a car at least")
        } else {
            print("No car damn")
        }
        
        
        if car.toSetup?.count == 0 {
            setup = Setup(context: context)
            car.addToToSetup(setup)
            ad.saveContext()
            print("We just created a new Setup")
        } else {
            setup = car.toSetup?.allObjects[0] as! Setup!
            print("Already have a set up, lets use that")
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        if setup.created != nil {
            navigationBar.topItem?.title = car.name! + ", " + dateFormatter.string(from: setup.created! as Date)
        } else {
            navigationBar.topItem?.title = dateFormatter.string(from: NSDate() as Date)
        }
        print("weh have setups:\(car.toSetup?.count)")
        if setup != nil {
            print("We have a setup in the main view controller.")
        }
        
        containerScrollView.delegate = self
        
        self.containerScrollView.contentSize = CGSize(width: CGFloat(segmentControl.numberOfSegments)*UIScreen.main.bounds.width, height: 495)
        
        var x = 0
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "Page1VC") as! Page1VC
        vc1.setup = setup
        obj.append(vc1)
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "Page2VC") as! Page2VC
        vc2.setup = setup
        obj.append(vc2)
        let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "Page3VC") as! Page3VC
        vc3.setup = setup
        obj.append(vc3)
        let vc4 = self.storyboard?.instantiateViewController(withIdentifier: "Page4VC") as! Page4VC
        vc4.setup = setup
        obj.append(vc4)
        let vc5 = self.storyboard?.instantiateViewController(withIdentifier: "Page5VC") as! Page5VC
        vc5.setup = setup
        obj.append(vc5)
        
        repeat {
            self.containerScrollView.addSubview(obj[x].view)
            obj[x].willMove(toParentViewController: self)
            self.addChildViewController(obj[x])
            obj[x].view.frame.origin =  CGPoint(x: (CGFloat(x))*UIScreen.main.bounds.width, y: 0)
            x += 1
            print("Page \(x) sucessfully initialized")
        } while (x < segmentControl.numberOfSegments)
        
        
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
//        obj4.view.frame.origin = CGPoint.init(x: 3*UIScreen.main.bounds.width, y: 0)
//        obj5.view.frame.origin = CGPoint.init(x: 4*UIScreen.main.bounds.width, y: 0)
        
        self.containerScrollView.frame = obj[2].view.frame

        // Do any additional setup after loading the view.
    }

    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        //Do shit
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for the popover configuration window
        if segue.identifier == "VoiceNoteVC" {
            if let controller = segue.destination as? VoiceNoteVC {
                controller.popoverPresentationController!.delegate = self
                controller.modalPresentationStyle = UIModalPresentationStyle.popover
                if let car = sender as? Car {
                    controller.car = car
                }
            }
        }
        if segue.identifier == "WrittenNoteVC" {
            if let controller = segue.destination as? WrittenNoteVC {
                controller.popoverPresentationController!.delegate = self
                controller.modalPresentationStyle = UIModalPresentationStyle.popover
                if let car = sender as? Car {
                    controller.car = car
                }
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.default,
            handler: nil)
        alertVC.addAction(okAction)
        present(
            alertVC,
            animated: true,
            completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            let note = Note(context: context)
//            note.picture = img
//            car.addToToNote(note)
//            ad.saveContext()
//            print(car.toNote!.count)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
