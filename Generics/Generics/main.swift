//
//  main.swift
//  Generics
//
//  Created by גיל אושר on 19/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

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

var p1 = Person();
p1.name = "Gil";
p1.age = 22;

var e1 = Employee();
e1.name = "Moran";
e1.age = 30;

e1.employeeNumber = 123;
e1.hourlyRate = 50;

func printPerson<T>(p: T){
    if p is Person || p is Employee{
        let o = p as! Person;
        print(o.description());
    }else{
        print("\(p) is not a supported type.")
    }
}

class Dog {
    
}
var dog = Dog();

printPerson(p1);
printPerson(e1);
printPerson(dog);

class MyClass<T>{
    var field: T;
    init(f: T){
        self.field = f;
    }
}

var myObject = MyClass<Int>(f: 8);







