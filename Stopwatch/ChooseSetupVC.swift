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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
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
