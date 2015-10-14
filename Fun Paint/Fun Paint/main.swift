//
//  main.swift
//  Fun Paint
//
//  Created by גיל אושר on 13/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var p:Point = Point();
var p2:Point = Point();
p2._xPos = 7;
p2._yPos = 7;
p._xPos = 5;
p._yPos = 5;
print(p.distanceFromPoint(p2))
print(p.distanceFromOrigin());
print(p.angelOfXaxis());
print(p.desctiption())

func compare(p1:Point, p2:Point)->Int{
    if(p1.distanceFromOrigin()>p2.distanceFromOrigin()){
        return 1;
    }else if(p1.distanceFromOrigin()<p2.distanceFromOrigin()){
        return -1;
    }else if(p1.angelOfXaxis()>p2.angelOfXaxis()){
        return 1;
    }else if(p1.angelOfXaxis()<p2.angelOfXaxis()){
        return -1;
    }
    return 0;
}