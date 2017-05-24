//
//  UIViewControllerStatusBar.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 18/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class UIViewControllerStatusBar: UIViewController {

    var statusbarViewExists: Bool = false
    
    override var prefersStatusBarHidden: Bool {
            return statusBarHiddenAppWide
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if statusBarHiddenAppWide == false && statusbarViewExists == false {
            let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
            let statusBarColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
            statusBarView.backgroundColor = statusBarColor
            view.addSubview(statusBarView)
            statusbarViewExists = true
        }
    }

}
