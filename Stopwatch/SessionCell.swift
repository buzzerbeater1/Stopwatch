//
//  SessionCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 10/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SessionCell: UITableViewCell {

    var label: UILabel?
    var yellowStrip: UIView?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        yellowStrip = UIView(frame: CGRect(x: 30, y: 0, width: 5, height: self.frame.height))
        yellowStrip?.backgroundColor = .yellow
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        label?.backgroundColor = .blue
        
        self.addSubview(label!)
        self.addSubview(yellowStrip!)
        
        yellowStrip?.isHidden = true
        
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.label?.text = ""
        self.yellowStrip?.isHidden = true
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
