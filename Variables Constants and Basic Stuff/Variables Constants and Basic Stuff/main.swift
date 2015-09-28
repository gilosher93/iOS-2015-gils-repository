//
//  main.swift
//  Variables Constants and Basic Stuff
//
//  Created by Elad Lavi on 9/21/15.
//  Copyright © 2015 Elad Lavi. All rights reserved.
//


import Foundation

//distance
func distance(x:Int, y:Int) -> Int{
    var dis:Int = 0;
    var small:Int = x;
    var large:Int = y;
    if small > large{
        small = y;
        large = x;
    }
    for _ in small..<large{
        dis++
    }
    return dis;
}
print("distance: ",distance(2, y: 9));




//product
func product(x:Int, y:Int)->Int{
    var result:Int = 0;
    var small = x;
    var large = y;
    if small>large{
        small = y;
        large = x;
    }
    for _ in 0..<small{
        result += large;
    }
    return result;
}

print("product: ",product(2, y: 16));



//quotient
func quotient(x:Int, y:Int)->Int{
    var counter:Int = 0;
    var  number = y;
    while(x>=number){
        counter++;
        number += y;
    }
    return counter;
}

print("quotient: ",quotient(12, y: 4));

//remainder
func remainder(x:Int, y:Int)->Int{
    if y > x || y == 0 || x==0{
        return x;
    }
    let pro = product(y, y: quotient(x, y: y));
    return distance(pro, y: x);
}

print("reminder:",remainder(0, y: 6));

//power
func power(x:Int, y:Int)->Int{
    if y==1{
        return x;
    }
    if x==0{
        return 0;
    }
    if y==0{
        return 1;
    }
    var result = x;
    for i in 1..<y{
        result = product(x, y: result);
    }
    return result;
}

print("power: ",power(2, y: 0));

//squred root
func squred(x:Int)->Int{
    if(x < 0){
        return -1;
    }
    if(x == 0){
        return 0;
    }
    for i in 1...x/2{
        if(product(i, y: i) == x){
            return i;
        }
    }
    
    return squred(x-1);
}

print("squred: ",squred(16));

//sum of digits
func sumOfDigit(x:Int)->Int{
    var result = 0;
    var number = x;
    while number>0{
        result += number % 10;
        number /= 10;
    }
    return result;
}

print("sum of digit: ",sumOfDigit(43254))

//largest digit
func largestDigit(x:Int)->Int{
    var max = 0;
    var number = x;
    var lastDigit:Int;
    while number > 0 {
        lastDigit = number % 10;
        if(lastDigit > max){
            max = lastDigit;
        }
        number /= 10;
    }
    return max;
}

print("largest digit: ",largestDigit(1537654));

//reverse digits
func reverse(x:Int)->Int{
    var number = x;
    var lastDigit:Int;
    var result = 0;
    while number > 0{
        lastDigit = number % 10;
        result = (result + lastDigit) * 10;
        number /= 10;
    }
    return result/10;
}

print("reverse: ",reverse(20340));



//arrays functions
print("arrays: ");
//a.sum
func sumOfArray(array:[Int])->Int{
    var sum = 0;
    for i in 0..<array.count{
        sum += array[i];
    }
    return sum;
}

var myArray = [6,8,1];
print("sum of array: ",sumOfArray(myArray));

//b.largest
func largestOfArray(array:[Int])->Int{
    var max = array[0];
    for i in 1..<array.count{
        if(array[i]>max){
            max = array[i];
        }
    }
    return max;
}

myArray = [2,-1,6,3,4,9,0];
print("largest number in array: ",largestOfArray(myArray));

//smaller
func smallerOfArray(array:[Int])->Int{
    var min = array[0];
    for i in 1..<array.count{
        if(array[i]<min){
            min = array[i];
        }
    }
    
    return min;
}

//c.average
func averageNumber(array:[Int])->Int{
    var sum:Int = 0;
    for i in 0..<array.count{
        sum += array[i];
    }
    return sum/array.count;
}

print("average number of array: ",averageNumber(myArray));

//d.sorted
func sortedArray(var array:[Int])->[Int]{
    var sortedArray:[Int] = [Int]();
    var smaller:Int?;
    for i in 0..<array.count{
        smaller = smallerOfArray(array);
        sortedArray.insert(smaller!, atIndex: i);
        array.removeAtIndex(array.indexOf(smaller!)!);
    }
    return sortedArray;
}

print("sorted array:",sortedArray(myArray));

//printX
func printX(var size:Int)->Void{
    let space:Character = " ";
    let star:Character = "*";
    var rowPrint:String;
    if(size%2 != 0){
        size -= 1;
    }
    for var i=0; i<size; ++i{
        rowPrint = "";
        for var j=0; j<i; ++j{
            rowPrint.append(space);
        }
        rowPrint.append(star);
        for var j=0; j<((size-i)*2-1); ++j{
            rowPrint.append(space);
        }
        rowPrint.append(star);
        print(rowPrint);
    }
    rowPrint = "";
    for var i=0; i<size-1; ++i{
        rowPrint.append(space);
    }
    print(rowPrint,star);
    for var i=0; i<size; ++i{
        rowPrint = "";
        for var j=0; j<(size-i-1); ++j{
            rowPrint.append(space);
        }
        rowPrint.append(star);
        for var j=0; j<(i*2+1); ++j{
            rowPrint.append(space);
        }
        rowPrint.append(star);
        print(rowPrint);
    }
}
print("print X:");
printX(6);



