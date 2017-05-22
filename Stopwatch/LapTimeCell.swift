//
//  LapTimeCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 3/11/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class LapTimeCell: UITableViewCell {

    
    
    var numberLabel: UILabel?
    var lapTimeLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        numberLabel = UILabel(frame: CGRect(x: 5, y: super.frame.midY - 10, width: 20, height: 20))
        lapTimeLabel = UILabel(frame: CGRect(x: 30, y: super.frame.midY - 10, width: super.frame.width - 30, height: 20))
        
        
        self.addSubview(lapTimeLabel!)
        self.addSubview(numberLabel!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
