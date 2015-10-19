//
//  SomeClass.swift
//  Protocols
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation


protocol PrinterProtocol{
    func printThis();
    func printThat();
}

class SomeClass {
    
    var delegate: PrinterProtocol?;
    
    func someEvent(){
        if let theDelegate = delegate{
            theDelegate.printThis();
        }
    }
}