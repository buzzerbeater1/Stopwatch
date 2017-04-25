//
//  ChooseSetupVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/21/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class ChooseSetupVC: UIViewController {

    var car: Car!
    
    @IBAction func preRaceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindCarDetailsVC", sender: true)
    }
    
    @IBAction func duringRaceButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindCarDetailsVC", sender: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindCarDetailsVC" {
            if let destination = segue.destination as? CarDetailsVC {
                if let bool = sender as? Bool {
                    destination.wantSetup = bool
                }
            }
        }
    }

}
