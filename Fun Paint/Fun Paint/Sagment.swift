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
    init(x1: Int, y1:Int, x2: Int, y2:Int){
        p1?._xPos = x1;
        p1?._yPos = y1;
        p2?._xPos = x2;
        p2?._yPos = y2;
    }
    convenience init(p1: Point, p2: Point){
        self.init(x1: p1._xPos, y1: p1._yPos, x2: p2._xPos, y2: p2._yPos);
    }
    convenience init(){
        self.init(x1: 0, y1: 0, x2: 1, y2: 1);
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



