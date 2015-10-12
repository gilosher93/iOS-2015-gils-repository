//
//  main.swift
//  Closures
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var names = ["Alex", "Guy", "Gil", "Gal"];

names.sortInPlace { (s1:String, s2:String) -> Bool in
    return s1 < s2;
}