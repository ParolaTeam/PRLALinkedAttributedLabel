//
//  Fruit.swift
//  PRLALinkedAttributedLabel
//
//  Created by Saggi Messer on 8/18/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import PRLALinkedAttributedLabel

class Fruit: NSObject, PRLAColoredNamed {
    
    var fruitName : String
    var color : UIColor
    
    //MARK:
    //MARK: PRLAColored
    
    var displayName : String {
        
        
        get {
            
            return self.fruitName
        }
    }
    
    var displayColor : UIColor {
        
        get {
            
            return self.color
        }
        
    }
    
    
    init(fruitName : String, color : UIColor) {
        
        self.fruitName = fruitName
        self.color = color
        
    }
    
}
