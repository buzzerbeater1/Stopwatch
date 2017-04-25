    //
//  CustomSegue.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/21/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation
import UIKit

class UIStoryboardSegueWithCompletion: UIStoryboardSegue {
    var completion: (() -> Void)?
    
    override func perform() {
        super.perform()
        if let completion = completion {
            completion()
        }
    }
}
