//
//  main.swift
//  More Stuff About Functions
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

//external parameter name

func someFunction(theFirstParameter param1: Int, theSecondParameter param2: Int){
    
    let sum = param1 + param2;
    print("the sum is \(sum)");
}

//someFunction(3, param2: 4);
//someFunction(3, theSecondParameter: 4);
someFunction(theFirstParameter: 3, theSecondParameter: 4);

//default value
func multiply(x: Int, by y: Int = 2) ->Int{
    return x*y;
}

multiply(3, by: 4);
multiply(3);


func calcRectangleArea(width width: Int, height: Int) ->Int{
    return width * height;
}


calcRectangleArea(width: 3, height: 4);



//variadic parameter
/*
func sum(x: Int, y: Int)->Int{
return x + y;
}
func sum(x: Int, y: Int, z: Int)->Int{
return sum(x, y: y) + z;
}
func sum(numbers: [Int])->Int{
var total = 0;
for num in numbers{
total += num;
}
return total;
}
var numbers = [Int]();
numbers.append(3);
numbers.append(12);
numbers.append(-3);
sum(numbers);
sum(3, y: 12, z: -3);
*/
var numbers = [Int]();
numbers.append(3);
numbers.append(12);
numbers.append(-3);


func sum(numbers:Int...)->Int{
    var total = 0;
    for num in numbers{
        total += num;
    }
    return total;
}
sum(3,4);
sum(1,2,-80);
//sum(numbers); //doesn't work... should have...


func stam(var x:Int){
    x++;
    print("in stam(), the value of x is \(x)");
}

var x = 8;
stam(x);
print("after the call to stam(), the value of x is \(x)");
//after the call to stam, the value x is still 8.



class Dog {
    var name:String;
    init(name: String){
        self.name = name;
    }
}


func handleDog(d: Dog){
    d.name += " handled";
}
var d = Dog(name: "snoopy");
handleDog(d);
print("dog's name is " + d.name);



func distance(var x: Int, var y: Int) ->Int{
    //let (small,large) = sortTwoNumbers(x, y: y);
    
    /*
    let small = min(x, y: y);
    let large = max(x, y: y);
    */
    /*
    var small = x;
    var large = y;
    if(x>y){
    small = y;
    large = x;
    }
    */
    sortTwoNumbers(&x, y: &y);
    
    var result = 0;
    while(x + result < y){
        result++;
    }
    return result;
}

/*    //no good, checking twice the same check
func min(x: Int, y: Int)->Int{
if x>y{
return y;
}
return x;
}
func max(x: Int, y: Int)->Int{
if x<y{
return y;
}
return x;
}
*/

/*
func sortTwoNumbers(x: Int, y: Int) ->(Int, Int){
if x>y{
return (y,x);
}else{
return (x,y);
}
}
*/

func sortTwoNumbers(inout x: Int, inout y: Int){
    if(x>y){
        let temp = x;
        x = y;
        y = temp;
    }
}







