//
//  PRLALinkedAttributedLabel.swift
//  Login
//
//  Created by Saggi Messer on 7/6/15.
//  Copyright (c) 2015 Aviv Sotzianu. All rights reserved.
//

import UIKit
import TTTAttributedLabel

private let BASE_ACTION_URL = "action://"

private func classNameAsString(obj: Any) -> String {
    //prints more readable results for dictionaries, arrays, Int, etc
    return _stdlib_getDemangledTypeName(obj).componentsSeparatedByString(".").last!
}

public protocol PRLANamed : AnyObject{
    
    var displayName : String {get}
    
}

public protocol PRLAColoredNamed : PRLANamed{
    
    var displayColor : UIColor {get}
    
}


public protocol PRLALinkedAttributedLabelDelegate {
    
    func didPressLinkTo(object : PRLANamed!)
    
}




public class PRLALinkedAttributedLabel: TTTAttributedLabel, TTTAttributedLabelDelegate {

    
    var linkedObjects = [PRLANamed]()
    var linkedRanges = [NSRange]()
    
    var baseFont : UIFont = UIFont.systemFontOfSize(20, weight: 0.1)
    var linkFont : UIFont = UIFont.systemFontOfSize(20, weight: 0.5)
    
    public var linkDelegate : PRLALinkedAttributedLabelDelegate?
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    
    func reset() {
        
        self.linkedObjects.removeAll(keepCapacity: true)
        self.linkedRanges.removeAll(keepCapacity: true)
        
    }
    
    public func buildTextFromObjects(objects : [AnyObject], baseFont : UIFont? , linkFont : UIFont? , andLineSpacing customLinespacing : CGFloat = 0.1) {
        
        self.reset()
        
        
        // set self as delegate
        
        self.delegate = self
        
        // set fonts
        if baseFont != nil {
            
            self.baseFont = baseFont!
            
        }
        
        if linkFont != nil {
            
            self.linkFont = linkFont!
            
        }
        
        self.linkAttributes = [NSFontAttributeName : self.linkFont]
        self.inactiveLinkAttributes = [NSFontAttributeName : self.linkFont]
        self.activeLinkAttributes = [NSFontAttributeName : self.linkFont]
        
        // create string
        
        var lastIndex = 0
        
        var tempString = NSMutableAttributedString(string: "")
        
        for object in objects {
            
            // check if is string
            
            if let stringObject = object as? String {
                
                    var newString = NSAttributedString(string: stringObject, attributes: [NSFontAttributeName : self.baseFont])
                    
                    tempString.appendAttributedString(newString)
                
                
            }
            
            if let namedObject = object as? PRLANamed {
                
               var objectRange = NSRange()
                
                objectRange.location = tempString.length
                objectRange.length = count(namedObject.displayName)
                
               
                
                self.linkedObjects.append(namedObject)
                self.linkedRanges.append(objectRange)
                
               var newString = NSMutableAttributedString(string: namedObject.displayName, attributes: [NSFontAttributeName : self.linkFont])
                
                
                if let coloredNamedObject = namedObject as? PRLAColoredNamed {
                    
                    newString.addAttribute(NSForegroundColorAttributeName, value: coloredNamedObject.displayColor, range: NSMakeRange(0, newString.length))
                    
                }

                
                
                tempString.appendAttributedString(newString)
                
                
            }
            
        
        }
        
        
        self.attributedText = tempString
        
        // set links
        
        
        
        for (index, object) in enumerate(self.linkedObjects) {
            
            var elementType = classNameAsString(object)
            
            var url = NSURL(string: BASE_ACTION_URL + "\(elementType)" + "/\(index)")
            
            if let conctreteActionURL = url {
                
                self.addLinkToURL(conctreteActionURL, withRange: self.linkedRanges[index])
            
            }
            
        }
        
        
        
 
        
    }
    
    
    public func attributedLabel(label: TTTAttributedLabel!, didSelectLinkWithURL url: NSURL!) {
        
        if let indexString = url.lastPathComponent, index = indexString.toInt() {
            
            var named = self.linkedObjects[index]
            
            self.linkDelegate?.didPressLinkTo(named)
            
        }
        
        
        
    }
    
    

}
