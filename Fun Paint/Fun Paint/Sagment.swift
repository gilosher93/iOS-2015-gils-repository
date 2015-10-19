//
//  Sagment.swift
//  Fun Paint
//
//  Created by גיל אושר on 14/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Sagment {
    private var _p1:Point?;
    private var _p2:Point?;
    private var _isChanged:Bool;
    
    var p1:Point?{
        set{
            _p1 = newValue;
        }get{
            return _p1;
        }
    }
    var p2:Point?{
        set{
            _p2 = newValue;
        }get{
            return _p2;
        }
    }
    
    init(p1: Point?, p2: Point?){
        //here we are preventing aliasing and also, the initilizer of Point expects a Point that is not optional.
        if let thePoint1 = p1{
            _p1 = Point(p: thePoint1);
        }else{
            _p1 = Point(x: 0, y: 0);
        }
        if let thePoint2 = p2{
            _p2 = Point(p: thePoint2);
        }else{
            _p2 = Point(x: 0, y: 0);
        }
        _isChanged = false;
    }
    
    
    convenience init(other: Sagment){
        self.init(p1: other.p1, p2: other.p2);
    }
    
    convenience init(){
        self.init(p1: Point(x: 0, y: 0), p2: Point(x: 0, y: 0));
    }
    
    var length:Double{
        get{
            if let thePoint1 = _p1{
                if let thePoint2 = _p2{
                    return thePoint1.distanceFromPoint(thePoint2)
                }
            }
            return -1;
        }
    }
    
    var slope:Double?{
        get{
            if let thePoint1 = _p1{
                if let thePoint2 = _p2{
                    let deltaX = Double(thePoint1._xPos - thePoint2._xPos);
                    let deltaY = Double(thePoint1._yPos - thePoint2._yPos);
                    if deltaX == 0{
                        return nil;
                    }
                    if deltaY == 0{
                        return 0;
                    }
                    return deltaX/deltaY;
                }
            }
            return nil;
        }
    }
}



