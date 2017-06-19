//
//  SessionCell.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 10/05/2017.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import UIKit

class SessionCell: UITableViewCell {

    var numberLabel: UILabel?
    var yellowStrip: UIView?
    var nameLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        yellowStrip = UIView(frame: CGRect(x: 30, y: 0, width: 5, height: self.bounds.height))
        yellowStrip?.backgroundColor = .yellow
        
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        numberLabel?.backgroundColor = .blue
        
        nameLabel = UILabel(frame: CGRect(x: 50, y: 10, width: self.bounds.width - 60, height: 20))
        nameLabel?.backgroundColor = UIColor.init(hue: 0.6, saturation: 1, brightness: 1, alpha: 0.1)
        
        self.addSubview(nameLabel!)
        self.addSubview(numberLabel!)
        self.addSubview(yellowStrip!)
        
        yellowStrip?.isHidden = true
        nameLabel?.isHidden = true
        
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        
        self.numberLabel?.text = ""
        self.yellowStrip?.isHidden = true
        self.nameLabel?.text = ""
        self.nameLabel?.isHidden = true
        self.numberLabel?.backgroundColor = .blue
        self.awakeFromNib()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
