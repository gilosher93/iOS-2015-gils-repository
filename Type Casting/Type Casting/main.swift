//
//  main.swift
//  Type Casting
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

let f1 = 9.99;
let i1 = Int(f1);
let d1 = Double(f1);
let b1 = Bool(f1); //b1 is true because f1 is NOT 0.
let s1 = String(f1);
let f2 = Double(i1);//f2 is 9.0 and not 9.99


class Person {
    var name: String = "Name";
    var age:Int = 0;
    
    func description()->String{
        return "I'm \(self.name) and I am \(self.age) years old";
    }
    
    func doPersonThings(){
        print("\(self.name) is doing person things...");
    }
}

class Employee: Person {
    var employeeNumber = 12345;
    var hourlyRate = 23.0;
    
    func doEmployeeThings(){
        print("\(self.name) is doing employee things...");
    }
    
    override func description() -> String {
        return super.description() + " My employee number is \(self.employeeNumber) and my hourly rate is \(self.hourlyRate)";
    }
}

var e1 = Employee();
e1.name = "Matan";
e1.doPersonThings();
e1.doEmployeeThings();

var p1:Person = e1;
print(p1.description());

//method 1:
var e2 = p1 as? Employee;
if let theEmployee = e2{
    theEmployee.doEmployeeThings();
}

//method 2:
if p1 is Employee{
    (p1 as! Employee).doEmployeeThings();
}





