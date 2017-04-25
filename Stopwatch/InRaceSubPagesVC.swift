//
//  InRaceSubPagesVC.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/21/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class InRaceSubPagesVC: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    var x: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testLabel.text = "\(Double(x))"
        
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

}
