//
//  SetupVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SetupVC: UIViewController {

    var car: Car!
    
    @IBOutlet weak var tirePressureFLTextfield: UITextField!
    @IBOutlet weak var tirePressureFRTextfield: UITextField!
    @IBOutlet weak var tirePressureRLTextfield: UITextField!
    @IBOutlet weak var tirePressureRRTextfield: UITextField!
    @IBOutlet weak var carNameLabel: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let currentSetup = car.toSetup?.allObjects as? [Setup] {
            if currentSetup.indices.contains(0) {
                currentSetup[0].tirePressureFL = Double(tirePressureFLTextfield.text!)!
                currentSetup[0].tirePressureFR = Double(tirePressureFRTextfield.text!)!
                currentSetup[0].tirePressureRR = Double(tirePressureRRTextfield.text!)!
                currentSetup[0].tirePressureRL = Double(tirePressureRLTextfield.text!)!
            } else {
                let newSetup = Setup(context: context)
                newSetup.tirePressureFL = Double(tirePressureFLTextfield.text!)!
                newSetup.tirePressureFR = Double(tirePressureFRTextfield.text!)!
                newSetup.tirePressureRR = Double(tirePressureRRTextfield.text!)!
                newSetup.tirePressureRL = Double(tirePressureRLTextfield.text!)!
                car.addToToSetup(newSetup)
                ad.saveContext()
            }
        }
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if car == nil {
            print("There is no car")
        } else {
            print("We have a car, that is cool")
        }
        
        configureLabels()
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

    func configureLabels() {
        carNameLabel.text = car.name
        if let carSetup = car.toSetup?.allObjects as? [Setup] {
            if carSetup.indices.contains(0) {
                tirePressureFLTextfield.text = String(carSetup[0].tirePressureFL)
                tirePressureFRTextfield.text = String(carSetup[0].tirePressureFR)
                tirePressureRRTextfield.text = String(carSetup[0].tirePressureRR)
                tirePressureRLTextfield.text = String(carSetup[0].tirePressureRL)
            }
        }
    }
}
