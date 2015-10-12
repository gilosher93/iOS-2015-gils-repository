//
//  main.swift
//  Classes
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

//create a pointer (reference). The pointer refer to nothing (nil).
var p:Person;
//create an instance(object) of Person:
//1. find a free space for the object (large enought to contain it)
//2. mark the space as taken
//3. initialize the space (zero).
//4. return the address in memory of the create object (its first byte)
//   and save the address of the new object to a variable (a pointer).
p = Person();


p.name = "Gil";
p.age = 22;
print(p.description());



var p2 = p; //now we have two pointers that point to the same address in memory

p.age = 23;
print("p2.age = " + String(p2.age));
//prints 23 because the two pointers point to the same address

func incrementAge(p: Person){
    p.age++;
}

incrementAge(p2);
print("p2.age = " + String(p2.age));

let p3 = Person();
p3.name = "Gil";
p3.age = 24; //this wouldn't work if Person was a struct

//p3 = p2; //this will not compile because p3 is let and we can't change its value (because it's a reference type, its value as actually an address in memory

print(p2 === p3); //we have to use === when we compare pointers

let p2IsEqualToP3 = p2.age == p3.age && p2.name == p3.name;

p2.lastName = "Gal";
print(p2.lastName);

var p4 = Person();

print(Person.species);

var p5:Person = Person();
print(p4.id)
print(p5.id)

