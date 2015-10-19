//
//  main.swift
//  Protocols
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class aSuperClass {
    
}


class aClass : aSuperClass, PrinterProtocol {
    func printThis() {
        print("printing this...");
    }
    func printThat() {
        print("printing that...");
    }
}


var a = aClass();
var someObject = SomeClass();
someObject.delegate = a;
someObject.someEvent();





















