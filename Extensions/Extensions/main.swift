//
//  main.swift
//  Extensions
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

print("Hello, World!")

var p1 = Person();
p1.name = "gil";
extension Person{
    func goToSleep(howManyHours: Int){
        print("\(self.name) is going to sleep for \(howManyHours) hours.")
    }
}

p1.goToSleep(9);