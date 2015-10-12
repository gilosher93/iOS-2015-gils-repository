//
//  main.swift
//  Draw On Canvas
//
//  Created by גיל אושר on 12/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

var canvas:[[Bool]] = [[Bool]]();
func initializeCanvas(inout canvas:[[Bool]], width: Int, height: Int){
    for _ in 0..<height{
        var line = [Bool]();
        for _ in 0..<width{
            line.append(false);
        }
        canvas.append(line);
    }
}

initializeCanvas(&canvas, width: 80, height: 17);

//canvas[line][column] = true;

func renderCanvas(inout canvas:[[Bool]]){
    for i in 0..<canvas.count{
        var lineAsString = "";
        let line = canvas[i];
        for j in 0..<line.count{
            lineAsString += line[j] ? "*" : " ";
        }
        print(lineAsString);
    }
}


func drawRectangleOnCanvas(x: Int, y: Int, width: Int, height: Int, inout canvas:[[Bool]]){
    
    for i in x ..< x+width{ //handle the two horizontal sides
        canvas[y][i] = true;
        canvas[y+height-1][i] = true;
    }
    for i in y ..< y+height{ //handle the two vertical sides
        canvas[i][x] = true;
        canvas[i][x+width-1] = true;
    }
}


drawRectangleOnCanvas(10, y: 5, width: 30, height: 7, canvas: &canvas);
drawRectangleOnCanvas(5, y: 2, width: 30, height: 7, canvas: &canvas);

renderCanvas(&canvas);
