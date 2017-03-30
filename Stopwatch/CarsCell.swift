//
//  CarsCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/28/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class CarsCell: UITableViewCell {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var carName: UILabel!
    
   
    func configureCell(car: Car){
        carImage.image = car.picture as? UIImage
        carModel.text = car.model
        carName.text = car.name
    }

}
