//
//  EntryScreenVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/23/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class EntryScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   
    @IBAction func stopwatchButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "StopwatchVC0", sender: nil)
    }

    @IBAction func lapTimerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "LapTimerVC", sender: nil)
    }
  

}
