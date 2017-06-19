//
//  OptionsVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 18/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class OptionsVC: UIViewControllerStatusBar {
    
    
    @IBAction func switchStatusBar(_ sender: UISwitch) {
        if sender.isOn {
            statusBarHiddenAppWide = true
        } else {
            statusBarHiddenAppWide = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
