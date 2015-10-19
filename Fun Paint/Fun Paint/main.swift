//
//  main.swift
//  Fun Paint
//
//  Created by גיל אושר on 13/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var p:Point = Point();
var otherPoint:Point = Point();
otherPoint._xPos = 7;
otherPoint._yPos = 2;
p._xPos = 1;
p._yPos = 2;
print(p.distanceFromPoint(otherPoint))
print(p.distanceFromOrigin());
print(p.angelOfXaxis());
print(p.desctiption());
var sag:Sagment = Sagment();
sag.p1 = p;
sag.p2 = otherPoint;
if let theSlope = sag.slope{
    print(theSlope)
}else{
    print("The Slope Undefined")
}

var arrayOfPoints:[AnyObject] = [Point(x: 18, y: 30), Point(x: 5, y: 7), Point(x: 3, y: 8)];
var p1 = arrayOfPoints[0] as! Point;
var p2 = arrayOfPoints[1] as! Point;
var p3 = arrayOfPoints[2] as! Point;

//comparator will return true if first parameter is larger than the second parameter.
func sortArray(inout items: [AnyObject], comparator: (AnyObject,AnyObject)->Bool){
    
    var lastPosition = items.count - 1;
    var isSorted = false;
    while(!isSorted){
        isSorted = true;
        for(var i = 0; i < lastPosition; i++){
            if(comparator(items[i] , items[i+1])){
                let temp = items[i];
                items[i] = items[i+1];
                items[i+1] = temp;
                isSorted = false;
            }
        }
        lastPosition--;
    }
    
}


sortArray(&arrayOfPoints) { (p1: AnyObject, p2: AnyObject) -> Bool in
    let point1 = p1 as! Point;
    let point2 = p2 as! Point;
    return point1.compare(point2) > 0;
}
var p11:Point = Point(x: 4, y: 9);
print(p11.desctiption())











