//
//  main.swift
//  draw circle
//
//  Created by גיל אושר on 08/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

func drawWhiteCircle(xPos:Int , yPos:Int, radius:Int){
    if(radius >= xPos || radius >= yPos){
        print("רדיוס גדול מידי")
        return;
    }
    var rowPrint:String;
    let star = "*";
    let space = " ";
    for i in 0...xPos*2{
        rowPrint = "";
        for j in 0...yPos*2{
            let distance = distanceFromPoints(Double(xPos), y1: Double(yPos) , x2: Double(i), y2: Double(j));
            rowPrint += distance - Double(radius) > 0.9 ? star : space;
            rowPrint += space;
        }
        print(rowPrint);
    }
}

func drawCircle(xPos:Int , yPos:Int, radius:Int){
    if(radius >= xPos || radius >= yPos){
        print("רדיוס גדול מידי")
        return;
    }
    var rowPrint:String;
    let star = "*";
    let space = " ";
    for i in 0...xPos*2{
        rowPrint = "";
        for j in 0...yPos*2{
            let distance = distanceFromPoints(Double(xPos), y1: Double(yPos) , x2: Double(i), y2: Double(j));
            rowPrint += distance - Double(radius) <= 1.3 && distance - Double(radius) >= 0.7  ? star : space;
            rowPrint += space;
        }
        print(rowPrint);
    }
}

func drawBlackCircle(xPos:Int , yPos:Int, radius:Int){
    if(radius >= xPos || radius >= yPos){
        print("רדיוס גדול מידי")
        return;
    }
    var rowPrint:String;
    let star = "*";
    let space = " ";
    for i in 0...xPos*2{
        rowPrint = "";
        for j in 0...yPos*2{
            let distance = distanceFromPoints(Double(xPos), y1: Double(yPos) , x2: Double(i), y2: Double(j));
            rowPrint += distance - Double(radius) <= 0.8 ? star : space;
            rowPrint += space;
        }
        print(rowPrint);
    }
}



func distanceFromPoints(x1:Double , y1:Double, x2:Double, y2:Double)->Double{
    let deltaX = x1-x2;
    let deltaY = y1-y2;
    return sqrt(deltaX*deltaX + deltaY*deltaY);
    
}

//drawWhiteCircle(10, yPos: 10, radius: 8)
//drawBlackCircle(10, yPos: 10, radius: 8)
//drawCircle(10, yPos: 10, radius: 8)