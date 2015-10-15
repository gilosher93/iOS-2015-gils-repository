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



