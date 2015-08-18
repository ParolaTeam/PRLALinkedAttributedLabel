//
//  Person.swift
//  PRLALinkedAttributedLabel
//
//  Created by Saggi Messer on 8/18/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import PRLALinkedAttributedLabel

class Person: NSObject, PRLANamed {
    
    var firstName : String
    var lastName : String
    var age : Int
    var height : Double
    
    //MARK:
    //MARK: PRLANamed

    var displayName : String {
        
        
        get {
            
            return self.firstName + " " + self.lastName
        }
    }
    
    init(firstName : String,lastName : String, age : Int, height: Double) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        
        
    }
    
    
    
    
   
}
