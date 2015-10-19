//
//  main.swift
//  Dictionaries
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var myArray = [Int]();
myArray.append(8);
myArray.append(19);
myArray.append(30);
print(myArray);
print("we have \(myArray.count) elements in the array");
if let positionOfEight = myArray.indexOf(8){
    myArray.removeAtIndex(positionOfEight);
}
print(myArray);

var d1: Dictionary<String, Int> = Dictionary();

var cities = [3: "Tel Aviv", 2: "Jerusalem", 8: "Modi'in"];

class Dog{
    var name:String;
    init(name:String){
        self.name = name;
    }
}

var pairs = [String : Dog]();
pairs["Snoopy"] = Dog(name: "Snoopy");
pairs["Rexi"] = Dog(name: "Rexi");

pairs["Rexi"] = Dog(name: "rexi")






