//
//  Point.swift
//  Fun Paint
//
//  Created by גיל אושר on 13/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Point {
    var _xPos:Int = 3;
    var _yPos:Int = 4;
    var xPos:Int{
        get{
            return _xPos;
        }
        set{
            _xPos = newValue;
        }
    }
    var yPos:Int{
        get{
            return _yPos;
        }
        set{
            _yPos = newValue;
        }
    }
    
    func distanceFromOrigin()->Double{
        return sqrt(Double(_xPos*_xPos) + Double(_yPos*_yPos));
    }
    
    func angelOfXaxis()->Double{
        return (atan(Double(xPos)/Double(yPos))*180)/M_PI;
    }
    func distanceFromPoint(p1:Point)->Double{
        let deltaX = Double(p1._xPos) - Double(_xPos);
        let deltaY = Double(p1._yPos) - Double(_yPos);
        return sqrt(deltaX*deltaX + deltaY*deltaY);
    }
    func desctiption()->String{
        return "(" + "\(_xPos)" + "," + "\(_yPos)" + ")";
    }
}

