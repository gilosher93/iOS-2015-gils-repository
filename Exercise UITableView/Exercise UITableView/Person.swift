//
//  Person.swift
//  Learning TableView
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person {
    private var name: String;
    private var age: Int;
    
    init(name: String, age: Int){
        self.name = name;
        self.age = age;
    }
    
    var _name: String{
        get{
            return name;
        }set{
            name = newValue;
        }
    }
    var _age: Int{
        get{
            return self.age;
        }set{
            self.age = newValue;
        }
    }
    func description()->String{
        return "\(name) : \(age)";
    }
}