//
//  Point.swift
//  Fun Paint
//
//  Created by גיל אושר on 13/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Point {
    var _xPos:Int;
    var _yPos:Int;
    var xPos:Int{
        get{
            return _xPos;
        }
        set{
            if newValue >= 0{
                _xPos = newValue;
            }
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
    init(x: Int, y: Int){
        _xPos = x;
        _yPos = y;
    }
    convenience init(p: Point){
        self.init(x: p.xPos, y: p.yPos);
    }
    convenience init(){
        self.init(x: 0, y: 0);
    }
    
    func distanceFromOrigin()->Double{
        return distanceFromPoint(0, y:0);
    }
    
    func angelOfXaxis()->Double{
        if _xPos == 0 {
            if _yPos != 0 {
                return 90;
            }
            return -1;
        }
        if _yPos == 0{
            return 0;
        }
        return (atan2(Double(_yPos), Double(_xPos))*180)/M_PI;
    }
    
    func distanceFromPoint(x: Int, y: Int)->Double{
        let deltaX = Double(x-self._xPos);
        let deltaY = Double(y-self._yPos);
        return sqrt(deltaX*deltaX + deltaY*deltaY);
    }
    
    func distanceFromPoint(otherPoint: Point)->Double{
        return distanceFromPoint(otherPoint._xPos, y: otherPoint._yPos);
    }
    
    func desctiption()->String{
        return "(" + "\(_xPos)" + "," + "\(_yPos)" + ")";
    }
    
    func compare(otherPoint:Point)->Int{
        let distanceFromOriginDifference = self.distanceFromOrigin() - otherPoint.distanceFromOrigin();
        if(distanceFromOriginDifference > 0 ){
            return 1;
        }else if(distanceFromOriginDifference < 0){
            return -1;
        }else{
            let angelDifference = self.angelOfXaxis()-otherPoint.angelOfXaxis();
            if(angelDifference > 0){
                return 1;
            }else if(angelDifference < 0){
                return -1;
            }
        }
        return 0;
    }
}

