//
//  Person.swift
//  Classes
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

class Person {
    //stored properties
    lazy var name:String = "name";
    var age:Int = 0;
    private var _lastName: String = "";
    
    //computed property
    var lastName:String{
        get{
            return _lastName;
        }
        set{
            if newValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding) < 10{
                _lastName = newValue;
            }
        }
    }
    private var _id:Int = ++counter;
    
    var id:Int{
        get{
            return _id;
        }
    }
    class var species:String{
        return "Homo Speins";
    }
    
    private static var counter:Int = 0;
    
    
    func description()->String{
        let yearOrYears = self.age == 1 ? "year" : "years";
        return "I'm \(self.name) and I am \(self.age) \(yearOrYears) old";
    }
    
}




/*
func setLastName(newValue: String){
if newValue.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)<10{
self._lastName = newValue;
}
}

func getLastName()->String{
return self._lastName;
}
*/