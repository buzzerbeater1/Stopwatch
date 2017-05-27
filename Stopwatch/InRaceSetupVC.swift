//
//  InRaceSetupVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/21/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class InRaceSetupVC: UIViewControllerStatusBar, UIScrollViewDelegate, UIPopoverPresentationControllerDelegate, UIImagePickerControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var expandedView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
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
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    var runTables = [UITableView]()
    var car: Car!
    var setupRuns = [SetupRun]()
    var imagePicker: UIImagePickerController!
    let rowNames = ["Tire Pressure","Tire Temperature","Fuel","Air/Track Temperature"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       imagePicker = UIImagePickerController()
 //       imagePicker.delegate = self
    
        let testRun = SetupRun(context: context)
        testRun.tirePressureRR = "11"
        testRun.tirePressureFL = "1"
        testRun.tirePressureFR = "2"
        testRun.tirePressureRL = "23"
        testRun.tireTemperatureFLIn = "1"
        testRun.tireTemperatureFLOut = "2"
        testRun.tireTemperatureFLMid = "3"
        testRun.tireTemperatureFRIn = "1"
        testRun.tireTemperatureFROut = "2"
        testRun.tireTemperatureFRMid = "3"
        testRun.tireTemperatureRLIn = "2"
        testRun.tireTemperatureRLOut = "3"
        testRun.tireTemperatureRLMid = "1"
        testRun.tireTemperatureRRIn = "2"
        testRun.tireTemperatureRROut = "3"
        testRun.tireTemperatureRRMid = "1"
        testRun.airTemp = "23"
        testRun.trackTemp = "43"
        testRun.fuel = "34"
        setupRuns.append(testRun)
        setupRuns.append(testRun)
        setupRuns.append(testRun)
        setupRuns.append(testRun)
        setupRuns.append(testRun)
        setupRuns.append(testRun)
        
        containerScrollView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.containerScrollView.decelerationRate = UIScrollViewDecelerationRateFast
        self.containerScrollView.contentSize = CGSize(width: CGFloat(setupRuns.count*100),height: containerScrollView.frame.height)
        
        var x = 0
        
        let frame = CGRect(x: 0, y: 0, width: 100, height: containerScrollView.frame.height)
        
        repeat {
            let tv = UITableView(frame: frame, style: .plain)
            tv.tag = x
            tv.delegate = self
            tv.dataSource = self
            tv.frame.origin =  CGPoint(x: (CGFloat(x))*100, y: 0)
            tv.register(SetupCell.self, forCellReuseIdentifier: "SetupCell")
            tv.rowHeight = 50
            runTables.append(tv)
            self.containerScrollView.addSubview(runTables[x])
            x += 1
            print("\(x) sucessfully initialized")
        } while (x < setupRuns.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "InRaceSetupDetailsVC" {
//            if let controller = segue.destination as? InRaceSetupDetailsVC {
//                controller.presentationController?.delegate = self
//                controller.modalPresentationStyle = .overCurrentContext
//                controller.view.superview?.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
//                controller.view.superview?.center = self.view.center
//            }
//        }
//    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.x < 10 {
            targetContentOffset.pointee.x = 0
        } else {
            let pageWidth = Float(100)
            let targetXContentOffset = Float(targetContentOffset.pointee.x)
            let newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
            let neededOffset = 100 - (Int(scrollView.frame.width) % 100)
            let point = CGPoint (x: CGFloat((newPage * pageWidth) + Float(neededOffset)), y: targetContentOffset.pointee.y)
            targetContentOffset.pointee = point
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == -1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Row Names", for: indexPath) as? RowNamesCell {
                cell.rowNameLabel.text = rowNames[indexPath.row]
                return cell
            }
        }
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SetupCell", for: indexPath) as? SetupCell {
            cell.createLayout(indexPath.row, dataFrom: setupRuns[tableView.tag])
            print(indexPath.row)
            return cell
        }
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowNames.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        for tv in runTables {
            tv.contentOffset.y = scrollView.contentOffset.y
        }
        tableView.contentOffset.y = scrollView.contentOffset.y
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        createOverlayInterface(indexPath.row, with: setupRuns[tableView.tag])
    }
    
    func createOverlayInterface(_ row: Int, with setup: SetupRun) {
        let background = UIButton(frame: self.view.frame)
        background.backgroundColor = .black
        background.alpha = 0.1
        background.addTarget(self, action: #selector(removeSubview), for: .touchUpInside)
        self.view.addSubview(background)
    }
    
    func removeSubview() {
        print("I SHOULD REMOVE ME LOL")
    }
}
