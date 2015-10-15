//
//  main.swift
//  Subscripts
//
//  Created by גיל אושר on 15/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

//subscripts


var array = ["a","b","c"];
let itemInTheArray = array[0]; //this is an example of subscript

class Person {
    var name: String = "Name";
    var age:Int = 0;
    
    func description()->String{
        return "My Name Is " + name + " And I'm " + String(age) + " " + (age == 1 ? " Year" : " Years") + " old."
    }
    
    private var roles = ["Manager", "Parent", "Runner"];
    
    subscript(index: Int) ->String{
        set(newValue){
            self.roles[index] = newValue;
        }
        get{
            return roles[index];
        }
        
    }
    
}


var p = Person();
p.name = "Gil";
p.age = 22;
p[1] = "Boss";
print(p[1]);






class Map {
    
    
    subscript(lat:Double, lng:Double)->String{
        get{
            return getCityName(lat, lng: lng);
        }
        set{
            setCityName(lat, lng: lng, name: newValue);
        }
    }
    
    func getCityName(lat:Double, lng:Double)->String{
        if(lat < 10 && lat > 5 && lng > 10 && lng < 20){
            return "Ramat Gan"
        }else{
            return "Jerusalem";
        }
    }
    
    func setCityName(lat:Double, lng:Double, name: String){
        
    }
    
}
var map = Map();
print(map[5,7]);