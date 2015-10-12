//
//  main.swift
//  Classes
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person {
    var name: String = "Name";
    var age: Int = 0;
    
    func description()->String{
        return "My name is \(self.name) and I am \(age) " + (age==1 ? "year" : "years") + " old";
    }
}

//create a pointer (reference). the pointer refer to nothing (nil).
var p = Person();
// create an instance(object) of Person.
// 1. find a free space for the object (large enought to contain it).
// 2. mark the space as taken
// 3. initialize the space (zero).
// 4. return the address in memory of the create object (its first byte)
//      and save the address of the new object to a variable (a pointer).
p = Person();

p.name = "Gil";
p.age = 1;
print(p.description());

var p2 = p; //now we have two pointers that point to the same address in memory.

