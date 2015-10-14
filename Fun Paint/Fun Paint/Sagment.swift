//
//  Sagment.swift
//  Fun Paint
//
//  Created by גיל אושר on 14/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Sagment {
    var p1:Point = Point();
    var p2:Point = Point();
    
    func length()->Double{
        return p1.distanceFromPoint(p2);
    }
}