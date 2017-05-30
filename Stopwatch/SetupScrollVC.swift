//
//  SetupScrollVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/5/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupScrollVC: UIViewControllerStatusBar, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var notesStackView: UIStackView!
    
    @IBAction func chooseSetupButtonPressed(_ sender: UIButton) {
        if tableView == nil {
            
            tableView = UITableView(frame: CGRect(x: 0,
                                                  y: navigationBar.frame.origin.y + navigationBar.frame.height,
                                                  width: super.view.bounds.width,
                                                  height: super.view.bounds.midY - (navigationBar.frame.origin.y + navigationBar.frame.height)))
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            tableView.rowHeight = 40
            tableView.register(LapTimeCell.self, forCellReuseIdentifier: "LapTimeCell")
            navigationBar.topItem?.title = "Pick a Setup"
        } else {
            if tableView.isHidden {
                tableView.reloadData()
                tableView.isHidden = false
                navigationBar.topItem?.title = "Pick a Setup"
            } else {
                tableView.isHidden = true
                createTopTitle()
            }
        }
        tableView.reloadData()
        print(setups.count)
        print("Hello")
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveSetup()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        containerScrollView.setContentOffset(CGPoint(x: CGFloat(segmentControl.selectedSegmentIndex)*UIScreen.main.bounds.width, y: 0), animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        setup = Setup(context: context)
        car.addToToSetup(setup)
        ad.saveContext()
        newSetupUpdate(setup)
        setups = car.toSetup?.allObjects as! [Setup]
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
    var tableView: UITableView!
    var setups = [Setup]() {
        didSet {
            setups = setups.sorted(by: { ($0.created?.timeIntervalSince1970)! > ($1.created?.timeIntervalSince1970)! })
        }
    }
    
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
            setups = car.toSetup?.allObjects as! [Setup]
            setup = setups[0]
            print("Already have a set up, lets use that")
        }
        createTopTitle()
        print("weh have setups:\(car.toSetup?.count)")
        if setup != nil {
            print("We have a setup in the main view controller.")
        }
        
        print("The height of the scrollView is: \(containerScrollView.bounds.height)")
        
        containerScrollView.delegate = self
        
        self.containerScrollView.contentSize = CGSize(width: CGFloat(segmentControl.numberOfSegments)*UIScreen.main.bounds.width, height: containerScrollView.bounds.height)
        
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
        
//        self.containerScrollView.frame = obj[2].view.frame

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        self.containerScrollView.contentSize = CGSize(width: CGFloat(segmentControl.numberOfSegments)*UIScreen.main.bounds.width, height: containerScrollView.bounds.height)
        let page1 = obj[0] as! Page1VC
        var baseHeight: CGFloat = 735
        var spacing = (UIScreen.main.bounds.width * (baseHeight/375) - 510)/17
        if UIScreen.main.bounds.width == 320 {
            spacing = (UIScreen.main.bounds.width * (baseHeight/375) - 510)/18
        }
        page1.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page1.scrollView.frame = containerScrollView.bounds
        page1.imageView.contentMode = .scaleToFill
        page1.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page1.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375)))
        page1.stackViewLeading.constant = page1.scrollView.bounds.midX + 10
        page1.stackViewBottom.constant = spacing*0.8
        page1.stackViewTop.constant = spacing*0.7
        page1.stackViewWidth.constant = CGFloat(100*(Double(page1.scrollView.bounds.width)/375))
        page1.stackViewTextFields.spacing = spacing
        let page2 = obj[1] as! Page2VC
        page2.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page2.scrollView.frame = containerScrollView.bounds
        page2.imageView.contentMode = .scaleToFill
        page2.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page2.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375)))
        page2.stackViewLeading.constant = page2.scrollView.bounds.midX + 10
        page2.stackViewBottom.constant = spacing*0.8
        page2.stackViewTop.constant = spacing*0.7
        page2.stackViewWidth.constant = CGFloat(100*(Double(page2.scrollView.bounds.width)/375))
        page2.stackViewTextFields.spacing = spacing
        spacing = (UIScreen.main.bounds.width * (baseHeight/375) - 540)/19
        baseHeight = 730
        let page3 = obj[2] as! Page3VC
        page3.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page3.scrollView.frame = containerScrollView.bounds
        page3.imageView.contentMode = .scaleToFill
        page3.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page3.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375)))
        page3.stackViewLeading.constant = page3.scrollView.bounds.midX + 10
        page3.stackViewBottom.constant = spacing*0.8
        page3.stackViewTop.constant = spacing*0.7
        page3.stackViewWidth.constant = CGFloat(100*(Double(page3.scrollView.bounds.width)/375))
        page3.stackViewTextFields.spacing = spacing
        let page4 = obj[3] as! Page4VC
        page4.scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page4.scrollView.frame = containerScrollView.bounds
        page4.imageView.contentMode = .scaleToFill
        page4.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375))
        page4.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * (baseHeight/375)))
        page4.stackViewLeading.constant = page4.scrollView.bounds.midX + 10
        page4.stackViewBottom.constant = spacing*0.8
        page4.stackViewTop.constant = spacing*0.7
        page4.stackViewWidth.constant = CGFloat(100*(Double(page4.scrollView.bounds.width)/375))
        page4.stackViewTextFields.spacing = spacing
        let page5 = obj[4] as! Page5VC
        baseHeight = 846
        let width: CGFloat = 375
        page5.scrollView.contentSize = CGSize(width: width, height: width * (baseHeight/375))
        page5.scrollView.frame = containerScrollView.bounds
        page5.imageView.contentMode = .scaleToFill
        page5.imageView.frame = CGRect(x: 0, y: 0, width: width, height: width * (baseHeight/375))
        page5.imageView.image?.draw(in: CGRect(x: 0, y: 0, width: width, height: width * (baseHeight/375)))
        
        
        print("SHIT I DID A NEW LAYOUT WTF!!!")
    }
    
    func popoverPresentationControllerDidDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) {
        //Do shit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == containerScrollView {
            segmentControl.selectedSegmentIndex = Int((containerScrollView.contentOffset.x+(UIScreen.main.bounds.width/2))/UIScreen.main.bounds.width)
        }
    }
    
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
            let note = PictureNote(context: context)
            note.picture = img
            car.addToToPictureNote(note)
            setup.addToToPictureNote(note)
            ad.saveContext()
            print(car.toPictureNote!.count)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setups.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LapTimeCell", for: indexPath) as? LapTimeCell {
            let number = indexPath.row + 1
            cell.numberLabel?.text = String(number) + "."
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, HH:mm"
            cell.lapTimeLabel?.text = car.name! + ", " + dateFormatter.string(from: setups[indexPath.row].created! as Date)
            return cell
        }
    return UITableViewCell()
    }
    
    func createTopTitle() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, HH:mm"
        if setup.created != nil {
            navigationBar.topItem?.title = car.name! + ", " + dateFormatter.string(from: setup.created! as Date)
        } else {
            navigationBar.topItem?.title = dateFormatter.string(from: NSDate() as Date)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newSetup = setups[indexPath.row]
        newSetupUpdate(newSetup)
        tableView.isHidden = true
    }
    
    func saveSetup() {
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
    
    func newSetupUpdate(_ newSetup: Setup) {
        saveSetup()
        let page1VC = self.childViewControllers[0] as! Page1VC
        page1VC.setup = newSetup
        page1VC.getWheel()
        let page2VC = self.childViewControllers[1] as! Page2VC
        page2VC.setup = newSetup
        page2VC.getWheel()
        let page3VC = self.childViewControllers[2] as! Page3VC
        page3VC.setup = newSetup
        page3VC.getWheel()
        let page4VC = self.childViewControllers[3] as! Page4VC
        page4VC.setup = newSetup
        page4VC.getWheel()
        let page5VC = self.childViewControllers[4] as! Page5VC
        page5VC.setup = newSetup
        page5VC.getWheel()
        createTopTitle()
    }
}
