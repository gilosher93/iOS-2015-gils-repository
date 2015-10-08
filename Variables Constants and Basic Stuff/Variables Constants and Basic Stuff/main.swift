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
    var result:Int = 0;
    var small:Int = x;
    var large:Int = y;
    if x > y{
        small = y;
        large = x;
    }
    while small + result < large{
        result++
    }
    return result;
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
    if y==0{
        return -1;
    }
    var result = 0;
    var  number = y;
    while(x>=number){
        result++;
        number += y;
    }
    return result;
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

//power in recursive mode:
func power(x:Int, y:Int)->Int{
    if(x==0){
        if (y == 0){
            return -1; // 0 to the 0 is illegal.
        }
        return 0; //to save CPU
    }
    if y==0 || x==1{
        return 1;
    }
    if y==1{
        return x;
    }
    
    return power(x, y: y-1) * x;
}

print("power: ",power(2, y: 4));

//squred root
func squred(x:Int)->Int{
    var result = 0;
    if(x < 0){
        return -1;
    }
    if(x == 0){
        return 0;
    }
    while result*result < x{
        result++;
    }
    
    return result;
}

print("squred: ",squred(16));

//sum of digits
func sumOfDigit(var x:Int)->Int{
    var result = 0;
    while (x>0){
        result += x % 10;
        x /= 10;
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
func reverse(var x:Int)->Int{
    var result = 0;
    
    while (x != 0){ // (!=) save CPU more than (>) or (<)
        result = result * 10 + x % 10;
        x /= 10;
    }
    return result;
}

print("reverse: ",reverse(123));



//arrays functions
print("----------arrays----------");
//a.sum
func sumOfArray(array:[Int])->Int{
    var sum = 0;
    for num in array{
        sum += num;
    }
    return sum;
}

var myArray = [6,8,1];
print("sum of array: ",sumOfArray(myArray));

//b.largest
func largestOfArray(nums:[Int])->Int{
    var max = nums[0];
    for i in 1..<nums.count{
        if(nums[i] > max){
            max = nums[i];
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
func averageNumber(nums:[Int])->Double{
    var sum = 0;
    for num in nums{
        sum += num;
    }
    return Double(sum) / Double(nums.count);
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
var startTime = NSDate().timeIntervalSince1970;
print("sorted array 1: ",sortedArray(myArray));
var endTime = NSDate().timeIntervalSince1970;
let distance1 = endTime - startTime;

//sorted array 2
func sortedArray2(inout nums:[Int]){
    var lastPosition = nums.count - 1;
    var isSorted = false;
    while !isSorted{
        isSorted = true;
        for(var i = 0; i < lastPosition; ++i){
            if(nums[i]>nums[i+1]){
                let temp = nums[i];
                nums[i] = nums[i+1];
                nums[i+1] = temp;
                isSorted = false;
            }
        }
        lastPosition--;
    }
}
var arr = [3,2,1,5,-1,6,0];
startTime = NSDate().timeIntervalSince1970;
print("sorted array 2: ",sortedArray2(&arr));
endTime = NSDate().timeIntervalSince1970;
let distance2 = endTime - startTime;
if(distance2 > distance1){
    print("gil more effective")
}else{
    print("elad more effective")
}
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
printX(10);

//rectangle
func printRectangle(xPos:Int, yPos:Int, width:Int,height:Int)->Void{
    if width == 0 || height == 0{
        print("width nor height can't be 0. please try again")
        return;
    }
    let space:Character = " ";
    let star:Character = "*";
    var xSpace:String = "";
    var rowPrint:String = "";
    for _ in 0..<yPos{
        print("");
    }
    for _ in 0..<xPos{
        xSpace.append(space);
    }
    
    rowPrint.appendContentsOf(xSpace);
    for _ in 0...width{
        rowPrint.append(star);
    }
    print(rowPrint);
    for var i=0; i<height-1; ++i{
        rowPrint = "";
        rowPrint.appendContentsOf(xSpace);
        rowPrint.append(star);
        if width>1{
            for _ in 0..<width-1{
                rowPrint.append(space);
            }
        }
        rowPrint.append(star);
        print(rowPrint);
    }
    rowPrint = "";
    rowPrint.appendContentsOf(xSpace);
    for _ in 0...width{
        rowPrint.append(star);
    }
    print(rowPrint);
    
}

printRectangle(15,yPos:10,width:30, height: 10);

func changeNumberInArray(inout nums:[Int]){
    nums[4] = -1;
}
var nums:[Int] = [1,4,6,8,9,13,56,42];



 