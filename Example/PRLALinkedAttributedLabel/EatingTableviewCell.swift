//
//  EatingTableviewCell.swift
//  PRLALinkedAttributedLabel
//
//  Created by Saggi Messer on 8/18/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import PRLALinkedAttributedLabel

class EatingTableviewCell: UITableViewCell {

    
    @IBOutlet weak var linkedLabel: PRLALinkedAttributedLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
