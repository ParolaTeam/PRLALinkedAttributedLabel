//
//  ViewController.swift
//  PRLALinkedAttributedLabel
//
//  Created by Saggi on 08/18/2015.
//  Copyright (c) 2015 Saggi. All rights reserved.
//

import UIKit
import PRLALinkedAttributedLabel

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PRLALinkedAttributedLabelDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var persons = [Person]()
    var fruits = [Fruit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.initObjects()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func initObjects() {
    
        let person1 = Person(firstName: "Abe", lastName: "Jackson", age: 40, height: 1.72)
        
        let person2 = Person(firstName: "Sisi", lastName: "Frame", age: 29, height: 1.63)
        
        let person3 = Person(firstName: "Idan", lastName: "Epshtein", age: 30, height: 1.83)
        
        self.persons.append(person1)
        self.persons.append(person2)
        self.persons.append(person3)
        
        let fruit1 = Fruit(fruitName: "Orange", color: UIColor.orangeColor())
        
        let fruit2 = Fruit(fruitName: "Apple", color: UIColor.greenColor())
        
        let fruit3 = Fruit(fruitName: "Bannana", color: UIColor.yellowColor())
        
        self.fruits.append(fruit1)
        self.fruits.append(fruit2)
        self.fruits.append(fruit3)
    
    
    }
    
    //MARK:
    //MARK: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.persons.count
        
    }
    
   
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("eatingCell") as! EatingTableviewCell
        
        // check if fruit starts witha  vowel
        var doesFruitStartWithVowel = false
        
        let firstIndex = self.fruits[indexPath.row].fruitName.startIndex
        
        switch (self.fruits[indexPath.row].fruitName[firstIndex]) {
            
            case "a","e","i","o","u","A","E","I","O","U":
             doesFruitStartWithVowel = true
        default:
            doesFruitStartWithVowel = false
            
        }
        
        // create proper english connection string
        let anString = doesFruitStartWithVowel ? "an " : "a "
        
        // build the linked attributed array from which the string will be built
        // objects must be either PRLANamed or a String
        var linkedArrayParts = [self.persons[indexPath.row]," ate ",anString,
            self.fruits[indexPath.row]," and smiled"]
        
        // linked label will build the text for you
        cell.linkedLabel.buildTextFromObjects(linkedArrayParts, baseFont: nil, linkFont: nil, andLineSpacing: 10)
        
        // set a delegate to recieve click events with the PRLANamed objects you supplied above!
        cell.linkedLabel.linkDelegate = self
        
        return cell
    }
    
    
    //MARK:
    //MARK: PRLALinkedAttributedLabelDelegate
    
    func didPressLinkTo(object : PRLANamed!) {
        
        NSLog("pressed: \(object.displayName)")
        
        if let person = object as? Person {
            
            NSLog("This person is \(person.age) years old")
            
        } else if let fruit = object as? Fruit {
            
            NSLog("This is a Fruit")
            
        }
        
        
    }
    

}

