//
//  EventsCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/26/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class EventsCell: UITableViewCell {
    
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(event: RaceEvent){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, d MMM yyyy"
        if let start = event.startDate {
            startDateLabel.text = dateFormatter.string(from: start as Date)
        }
        if let end = event.endDate {
            endDateLabel.text = dateFormatter.string(from: end as Date)
        }
        locationLabel.text = event.location
    }
    
}
