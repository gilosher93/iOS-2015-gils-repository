//
//  main.swift
//  Initializers
//
//  Created by גיל אושר on 15/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person{
    //option 3 - initializer
    var name: String;
    private var _age: Int;
    
    init(name: String, age: Int){
        print("in name-age initiazlier...");
        self.name = name;
        self._age = age;
    }
    
    convenience init(){
        print("in default initiazlier...");
        //name = "Name";
        //age = 0;
        self.init(name: "Name", age: 0);
        
    }
    
    var age:Int{
        get{
            return _age;
        }
        set{
            _age = newValue;
        }
    }
    
    
    func description()->String{
        return "I'm " + name + " and I'm " + String(_age) + " " + (_age == 1 ? "year" : "years") + " old."
    }
    
    
    /*
    //option 1 - marking the fields as optional
    var name: String?; //optional, may be nil
    var age: Int?;
    
    func description()->String{
    var n = "";
    if let theName = name{
    n = theName;
    }
    var a = 0;
    if let theAge = age{
    a = theAge;
    }
    
    return "I'm " + n + " and I'm " + String(a) + " " + (a == 1 ? "year" : "years") + " old."
    }*/
    
    /*
    //option 2 - giving up on Swift nil protection
    var name: String!;
    var age: Int!;
    
    func description()->String{
    return "I'm " + name + " and I'm " + String(age) + " " + (age == 1 ? "year" : "years") + " old."
    }
    */
    
}

//var p = Person(name: "Gal", age: 29);
//var p = Person();
//print(p.description());


class Animal {
    var age:Int;
    init(age: Int){
        print("in animal init");
        self.age = age;
    }
}

class Dog: Animal{
    var color:String;
    init(){
        color = "brown";
        super.init(age: 2);
    }
}
var d = Dog();

