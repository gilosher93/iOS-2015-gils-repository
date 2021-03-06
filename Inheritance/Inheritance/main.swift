//
//  main.swift
//  Inheritance
//
//  Created by גיל אושר on 15/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person{
    var name: String =  "Name";
    var age: Int = 0;
    
    func description()->String{
        return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old."
    }
}

class Employee: Person {
    var employeeNumber:Int = 1234;
    var hourlyRate = 23.0;
    
    override func description() -> String {
        return super.description() + " My employee number is " + String(employeeNumber) + " and my hourly rate is " + String(hourlyRate);
    }
}

var emp = Employee();
emp.age = 20;
emp.hourlyRate = 30.0;
var emp2:Person = Employee();
var emp2AsEmployee = emp2 as! Employee;
emp2AsEmployee.hourlyRate = 35.00;
//print(emp2.description());

class A {
    
}

class B: A {
    func stam(){
        print("stam...");
    }
}

var b:A = A();
let c = b as? B;
//print(c?.stam());
if let theC = c{
    theC.stam();
}else{
    print("c is nil");
}
//another way:
if b is B{
    (b as! B).stam();
}else{
    print("b cannot be cast to B, wrong type");
}




