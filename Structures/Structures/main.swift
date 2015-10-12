//
//  main.swift
//  Structures
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

struct Rectangle {
    var x: Int = 0;
    var y: Int = 0;
    var width: Int = 0;
    var height: Int = 0;
    
    func description()->String{
        return "x: \(x), y: \(y), width: \(width), height: \(height)";
    }
    
}


var rect1 = Rectangle();
rect1.x = 10;
rect1.y = 10;
rect1.width = 100;
rect1.height = 50;

print("rect1 -> " + rect1.description());

//structs are value types!!!!


var rect2 = rect1;
rect1.x = 12;
print("rect1 -> " + rect1.description());
print("rect2 -> " + rect2.description());