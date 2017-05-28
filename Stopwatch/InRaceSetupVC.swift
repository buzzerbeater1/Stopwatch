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
    
    var currentRow: Int = 0
    var subviewNeedsLayout = true
    var currentTable: Int = 0
    var runTables = [UITableView]()
    var car: Car!
    var setupRuns = [SetupRun]() {
        didSet {
            setupRuns = setupRuns.sorted(by: { ($0.created?.timeIntervalSince1970)! > ($1.created?.timeIntervalSince1970)! })
            print("SetupRuns just got set!!, there are \(setupRuns.count) Setups")
        }
    }
    var imagePicker: UIImagePickerController!
    let rowNames = ["Tire Pressure","Tire Temperature","Fuel","Air/Track Temperature"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       imagePicker = UIImagePickerController()
 //       imagePicker.delegate = self
    
        overlayInit()
        
        if car != nil {
            setupRuns = car.toSetupRun?.allObjects as! [SetupRun]
        }
//        let testRun = SetupRun(context: context)
//        testRun.tirePressureRR = "11"
//        testRun.tirePressureFL = "1"
//        testRun.tirePressureFR = "2"
//        testRun.tirePressureRL = "23"
//        testRun.tireTemperatureFLIn = "1"
//        testRun.tireTemperatureFLOut = "3"
//        testRun.tireTemperatureFLMid = "2"
//        testRun.tireTemperatureFRIn = "1"
//        testRun.tireTemperatureFROut = "3"
//        testRun.tireTemperatureFRMid = "2"
//        testRun.tireTemperatureRLIn = "1"
//        testRun.tireTemperatureRLOut = "3"
//        testRun.tireTemperatureRLMid = "2"
//        testRun.tireTemperatureRRIn = "1"
//        testRun.tireTemperatureRROut = "3"
//        testRun.tireTemperatureRRMid = "2"
//        testRun.airTemp = "23"
//        testRun.trackTemp = "43"
//        testRun.fuel = "34"
//        setupRuns.append(testRun)
//        let testRun2 = SetupRun(context: context)
//        testRun2.tirePressureRR = "15"
//        testRun2.tirePressureFL = "5"
//        testRun2.tirePressureFR = "12"
//        testRun2.tirePressureRL = "8"
//        testRun2.tireTemperatureFLIn = "7"
//        testRun2.tireTemperatureFLOut = "9"
//        testRun2.tireTemperatureFLMid = "8"
//        testRun2.tireTemperatureFRIn = "7"
//        testRun2.tireTemperatureFROut = "9"
//        testRun2.tireTemperatureFRMid = "8"
//        testRun2.tireTemperatureRLIn = "7"
//        testRun2.tireTemperatureRLOut = "9"
//        testRun2.tireTemperatureRLMid = "8"
//        testRun2.tireTemperatureRRIn = "7"
//        testRun2.tireTemperatureRROut = "9"
//        testRun2.tireTemperatureRRMid = "8"
//        testRun2.airTemp = "57"
//        testRun2.trackTemp = "55"
//        testRun2.fuel = "12"
//        setupRuns.append(testRun2)
        
        containerScrollView.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if subviewNeedsLayout && setupRuns.count != 0 {
            self.containerScrollView.decelerationRate = UIScrollViewDecelerationRateFast
            self.containerScrollView.contentSize = CGSize(width: CGFloat(setupRuns.count*100),height: containerScrollView.frame.height)
            
            
            
            let frame = CGRect(x: 0, y: 0, width: 100, height: containerScrollView.frame.height)
            
            repeat {
                let x = runTables.count
                let tv = UITableView(frame: frame, style: .plain)
                tv.tag = x
                tv.delegate = self
                tv.dataSource = self
                tv.frame.origin =  CGPoint(x: (CGFloat(x))*100, y: 0)
                tv.register(SetupCell.self, forCellReuseIdentifier: "SetupCell")
                tv.rowHeight = 50
                runTables.append(tv)
                self.containerScrollView.addSubview(runTables[x])
                //print("\(x) sucessfully initialized")
            } while (runTables.count < setupRuns.count)
            subviewNeedsLayout = false
        }
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
            print(cell.subviews == [])
            if cell.needLayout {
                //print("NEED LAYOUT AT ROW: \(indexPath.row) IN TABLEVIEW NR: \(tableView.tag)")
                cell.createLayout(indexPath.row, dataFrom: setupRuns[tableView.tag])
            }
            cell.updateValues(indexPath.row, with: setupRuns[tableView.tag])
            
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
        if tableView.tag >= 0 {
            currentRow = indexPath.row
            currentTable = tableView.tag
            createOverlayInterface(indexPath.row, with: setupRuns[tableView.tag])
        }
    }
    
    // Overlay Constants will be put here until a custom view can be made reliable.
    var background: UIButton!
    var overlay: UIView!
    var verticalBar: UIView!
    var horizontalBar: UIView!
    var tirePressureFLTextField: UITextField!
    var tirePressureFRTextField: UITextField!
    var tirePressureRLTextField: UITextField!
    var tirePressureRRTextField: UITextField!
    var tireTemperatureFLOutTextField: UITextField!
    var tireTemperatureFLMidTextField: UITextField!
    var tireTemperatureFLInTextField: UITextField!
    var tireTemperatureFROutTextField: UITextField!
    var tireTemperatureFRMidTextField: UITextField!
    var tireTemperatureFRInTextField: UITextField!
    var tireTemperatureRLOutTextField: UITextField!
    var tireTemperatureRLMidTextField: UITextField!
    var tireTemperatureRLInTextField: UITextField!
    var tireTemperatureRROutTextField: UITextField!
    var tireTemperatureRRMidTextField: UITextField!
    var tireTemperatureRRInTextField: UITextField!
    var fuelTextfield: UITextField!
    var airTempTextfield: UITextField!
    var trackTempTextfield: UITextField!
    // End of Overlay Constants.
    
    func createOverlayInterface(_ row: Int, with setup: SetupRun) {
        background = UIButton(frame: self.view.frame)
        background.backgroundColor = .black
        background.alpha = 0.3
        background.addTarget(self, action: #selector(removeSubview), for: .touchUpInside)
        background.tag = -2
        self.view.addSubview(background)
        overlay = UIView(frame: CGRect(x: super.view.frame.width * 0.05, y: super.view.frame.height * 0.35, width: super.view.frame.width * 0.9, height: super.view.frame.height * 0.3))
        overlay.backgroundColor = .white
        overlay.tag = -3
        overlay.layer.borderWidth = 2
        overlay.layer.borderColor = UIColor.black.cgColor
        overlay.layer.cornerRadius = 10
        self.view.addSubview(overlay)
        verticalBar = UIView(frame: CGRect(x: overlay.bounds.midX - 2, y: 0, width: 4, height: overlay.bounds.height))
        verticalBar.backgroundColor = .black
        horizontalBar = UIView(frame: CGRect(x: 0, y: overlay.bounds.midY - 2, width: overlay.bounds.width, height: 4))
        horizontalBar.backgroundColor = .black
        var textFields = [UITextField]()
        let midY = overlay.bounds.midY
        let midX = overlay.bounds.midX
        if row == 0 {
            tirePressureFLTextField = UITextField(frame: CGRect(x: 5, y: 5, width: midX - 10, height: midY - 10))
            textFields.append(tirePressureFLTextField)
            tirePressureFRTextField = UITextField(frame: CGRect(x: midX + 5, y: 5, width: midX - 10, height: midY - 10))
            textFields.append(tirePressureFRTextField)
            tirePressureRLTextField = UITextField(frame: CGRect(x: 5, y: midY + 5, width: midX - 10, height: midY - 10))
            textFields.append(tirePressureRLTextField)
            tirePressureRRTextField = UITextField(frame: CGRect(x: midX + 5, y: midY + 5, width: midX - 10, height: midY - 10))
            textFields.append(tirePressureRRTextField)
            overlay.addSubview(verticalBar)
            overlay.addSubview(horizontalBar)
            tirePressureRRTextField.text = setup.tirePressureRR
            tirePressureRLTextField.text = setup.tirePressureRL
            tirePressureFRTextField.text = setup.tirePressureFR
            tirePressureFLTextField.text = setup.tirePressureFL
        } else if row == 1 {
            let width = (overlay.bounds.width - 40) / 6
            let height = (overlay.bounds.height - 20) / 2
            tireTemperatureFLOutTextField = UITextField(frame: CGRect(x: 5, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFLOutTextField)
            tireTemperatureFLMidTextField = UITextField(frame: CGRect(x: 10 + width, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFLMidTextField)
            tireTemperatureFLInTextField = UITextField(frame: CGRect(x: 15 + 2 * width, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFLInTextField)
            tireTemperatureFROutTextField = UITextField(frame: CGRect(x: 35 + 5 * width, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFROutTextField)
            tireTemperatureFRMidTextField = UITextField(frame: CGRect(x: 30 + 4 * width, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFRMidTextField)
            tireTemperatureFRInTextField = UITextField(frame: CGRect(x: 25 + 3 * width, y: 5, width: width, height: height))
            textFields.append(tireTemperatureFRInTextField)
            tireTemperatureRLOutTextField = UITextField(frame: CGRect(x: 5, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRLOutTextField)
            tireTemperatureRLMidTextField = UITextField(frame: CGRect(x: 10 + width, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRLMidTextField)
            tireTemperatureRLInTextField = UITextField(frame: CGRect(x: 15 + 2 * width, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRLInTextField)
            tireTemperatureRROutTextField = UITextField(frame: CGRect(x: 35 + 5 * width, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRROutTextField)
            tireTemperatureRRMidTextField = UITextField(frame: CGRect(x: 30 + 4 * width, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRRMidTextField)
            tireTemperatureRRInTextField = UITextField(frame: CGRect(x: 25  + 3 * width, y: 15 + height, width: width, height: height))
            textFields.append(tireTemperatureRRInTextField)
            overlay.addSubview(horizontalBar)
            overlay.addSubview(verticalBar)
            tireTemperatureFLMidTextField.text = setup.tireTemperatureFLMid
            tireTemperatureFLOutTextField.text = setup.tireTemperatureFLOut
            tireTemperatureFLInTextField.text = setup.tireTemperatureFLIn
            tireTemperatureFRMidTextField.text = setup.tireTemperatureFRMid
            tireTemperatureFROutTextField.text = setup.tireTemperatureFROut
            tireTemperatureFRInTextField.text = setup.tireTemperatureFRIn
            tireTemperatureRLMidTextField.text = setup.tireTemperatureRLMid
            tireTemperatureRLOutTextField.text = setup.tireTemperatureRLOut
            tireTemperatureRLInTextField.text = setup.tireTemperatureRLIn
            tireTemperatureRRMidTextField.text = setup.tireTemperatureRRMid
            tireTemperatureRROutTextField.text = setup.tireTemperatureRROut
            tireTemperatureRRInTextField.text = setup.tireTemperatureRRIn
        } else if row == 2 {
            fuelTextfield = UITextField(frame: CGRect(x: 5, y: 5, width: midX - 5, height: overlay.bounds.height - 10))
            textFields.append(fuelTextfield)
            overlay.addSubview(verticalBar)
            fuelTextfield.text = setup.fuel
        } else if row == 3 {
            airTempTextfield = UITextField(frame: CGRect(x: 5, y: 5, width: midX - 5, height: overlay.bounds.height - 10))
            textFields.append(airTempTextfield)
            trackTempTextfield = UITextField(frame: CGRect(x: midX + 5, y: 5, width: midX - 5, height: overlay.bounds.height - 10))
            textFields.append(trackTempTextfield)
            overlay.addSubview(verticalBar)
            airTempTextfield.text = setup.airTemp
            trackTempTextfield.text = setup.trackTemp
        }
        for tf in textFields {
            tf.textAlignment = .center
            tf.borderStyle = .none
            tf.font = UIFont(name: "Arial", size: 50)
            tf.adjustsFontSizeToFitWidth = true
            tf.keyboardType = .numbersAndPunctuation
            overlay.addSubview(tf)
        }
    }
    
    
    func removeSubview() {
        saveData()
        if let overlayInterface = view.viewWithTag(-3) {
            overlayInterface.removeFromSuperview()
        }
        if let overlayBackground = view.viewWithTag(-2) {
            overlayBackground.removeFromSuperview()
        }
    }
    
    func saveData() {
        let x = currentTable
        let y = currentRow
        if y == 0 {
        setupRuns[x].tirePressureFL = tirePressureFLTextField.text
        setupRuns[x].tirePressureFR = tirePressureFRTextField.text
        setupRuns[x].tirePressureFR = tirePressureRLTextField.text
        setupRuns[x].tirePressureRR = tirePressureRRTextField.text
        } else if y == 1 {
        setupRuns[x].tireTemperatureFLOut = tireTemperatureFLOutTextField.text
        setupRuns[x].tireTemperatureFLMid = tireTemperatureFLMidTextField.text
        setupRuns[x].tireTemperatureFLIn = tireTemperatureFLInTextField.text
        setupRuns[x].tireTemperatureFROut = tireTemperatureFROutTextField.text
        setupRuns[x].tireTemperatureFRMid = tireTemperatureFRMidTextField.text
        setupRuns[x].tireTemperatureFRIn = tireTemperatureFRInTextField.text
        setupRuns[x].tireTemperatureRLOut = tireTemperatureRLOutTextField.text
        setupRuns[x].tireTemperatureRLMid = tireTemperatureRLMidTextField.text
        setupRuns[x].tireTemperatureRLIn = tireTemperatureRLInTextField.text
        setupRuns[x].tireTemperatureRROut = tireTemperatureRROutTextField.text
        setupRuns[x].tireTemperatureRRMid = tireTemperatureRRMidTextField.text
        setupRuns[x].tireTemperatureRRIn = tireTemperatureRRInTextField.text
        } else if y == 2 {
        setupRuns[x].fuel = fuelTextfield.text
        } else if y == 3 {
        setupRuns[x].airTemp = airTempTextfield.text
        setupRuns[x].trackTemp = trackTempTextfield.text
        }
        runTables[x].reloadData()
    }
    
    func overlayInit() {
        tirePressureFLTextField = UITextField()
        tirePressureFRTextField = UITextField()
        tirePressureRLTextField = UITextField()
        tirePressureRRTextField = UITextField()
        tireTemperatureFLOutTextField = UITextField()
        tireTemperatureFLMidTextField = UITextField()
        tireTemperatureFLInTextField = UITextField()
        tireTemperatureFROutTextField = UITextField()
        tireTemperatureFRMidTextField = UITextField()
        tireTemperatureFRInTextField = UITextField()
        tireTemperatureRLOutTextField = UITextField()
        tireTemperatureRLMidTextField = UITextField()
        tireTemperatureRLInTextField = UITextField()
        tireTemperatureRROutTextField = UITextField()
        tireTemperatureRRMidTextField = UITextField()
        tireTemperatureRRInTextField = UITextField()
        fuelTextfield = UITextField()
        airTempTextfield = UITextField()
        trackTempTextfield = UITextField()
    }
}
