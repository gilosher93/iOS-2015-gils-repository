//
//  Person.swift
//  Learning TableView
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person {
    var name: String;
    var age: Int;
    
    init(name: String, age: Int){
        self.name = name;
        self.age = age;
    }
    
    var _name: String{
        get{
            return name;
        }set{
            name = _name;
        }
    }
    var _age: Int{
        get{
            return self.age;
        }set{
            self.age = _age;
        }
    }
}