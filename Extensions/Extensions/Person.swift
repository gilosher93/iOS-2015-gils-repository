//
//  Person.swift
//  Extensions
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person {
    var name: String = "Name";
    var age:Int = 0;
    
    func description()->String{
        return "I'm \(self.name) and I am \(self.age) years old";
    }
    
    func doPersonThings(){
        print("\(self.name) is doing person things...");
    }
}