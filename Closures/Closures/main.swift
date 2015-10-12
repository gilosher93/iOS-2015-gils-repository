//
//  main.swift
//  Closures
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var names = ["Alex", "Guy", "Gil", "Gal"];

/*
names.sortInPlace { (s1: String, s2: String) -> Bool in
return s1 < s2;
}
*/

let compare = {(s1: String, s2: String)->Bool in
    return s1 < s2;
};

//names.sortInPlace(compare);

let f = compare("A","B");
//print(f);

/*
func compare(s1: String, s2: String) -> Bool{
return s1 < s2;
}
names.sortInPlace(compare);
*/

//print(names);


//function the expects to receive three parameters, two values and a closue
func mySort(a:String, b: String, sortRule: (String, String)->Bool){
    
    if sortRule(a, b){//the closue is invoked like a function
        print("b is larger");
    }else{
        print("a is larger");
    }
    
}


//call the function with three parameters:
mySort("A", b: "B", sortRule: { (s1: String, s2: String) -> Bool in
    return s1 < s2;
});

//or even like this:
mySort("A", b: "B"){ (s1: String, s2: String) -> Bool in
    return s1 < s2;
};
