//
//  View.swift
//  Graphics
//
//  Created by גיל אושר on 10.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class View: UIView {
    override func drawRect(rect: CGRect) {
        //drawText();
        //drawImage();
        //drawLine();
        //drawPath();
        //drawRectangle();
        //addShadowToShapes();
        transformView();
    }
    
    func drawText(){
        let fontName = "HelveticaNeue-Bold";
        let helvetivaBold = UIFont(name: fontName, size: 40);
        let string = "some text" as NSString;
        string.drawAtPoint(CGPoint(x: 40, y: 180), withAttributes: [NSFontAttributeName : helvetivaBold!]);
    }
    
    func drawImage(){
        let image = UIImage(named: "waze");
        //image.drawAtPoint(CGPoint(x: 50, y: 50));
        image!.drawInRect(CGRect(x: 20, y: 20, width: 50, height: 50))
    }
    
    func drawLine(){
        UIColor.brownColor().set();
        let context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 5); //thickness = ovi
        CGContextSetLineJoin(context, CGLineJoin.Round) //define how the joint will looks like
        CGContextMoveToPoint(context, 150, 200); //from point
        CGContextAddLineToPoint(context, 80, 300); //to point
        CGContextAddLineToPoint(context, 220, 300);
        CGContextAddLineToPoint(context, 150, 200);
        CGContextAddLineToPoint(context, 80, 300);
        
        CGContextMoveToPoint(context, 80, 233);
        CGContextAddLineToPoint(context, 220, 233);
        CGContextAddLineToPoint(context, 150, 333);
        CGContextAddLineToPoint(context, 80, 233);
        CGContextAddLineToPoint(context, 220, 233);
        CGContextStrokePath(context); //actually draw the line.
    }
    
    func drawPath(){
        let path = CGPathCreateMutable();
        let screenBounds = UIScreen.mainScreen().bounds;
        
        CGPathMoveToPoint(path, nil, screenBounds.origin.x, screenBounds.origin.y);
        CGPathAddLineToPoint(path, nil, screenBounds.size.width, screenBounds.size.height);
        CGPathMoveToPoint(path, nil, screenBounds.size.width, screenBounds.origin.y);
        CGPathAddLineToPoint(path, nil, screenBounds.origin.x, screenBounds.size.height);
        let context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, path);
        UIColor.blueColor().setStroke();
        CGContextSetLineWidth(context, 5)
        CGContextDrawPath(context, CGPathDrawingMode.Stroke);
    }
    
    func drawRectangle(){
        let path = CGPathCreateMutable();
        let rectangle = CGRect(x: 10, y: 30, width: 200, height: 300);
        CGPathAddRect(path, nil, rectangle);
        let context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, path);
        UIColor(red: 0.2, green: 0.6, blue: 0.8, alpha: 1.0).setFill();
        UIColor.yellowColor().setStroke();
        CGContextSetLineWidth(context, 5)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke);
    }
    
    func addShadowToShapes(){
        let context = UIGraphicsGetCurrentContext();
        let offset = CGSize(width: 10, height: 10);
        CGContextSetShadowWithColor(context, offset, 20, UIColor.grayColor().CGColor);
        let path = CGPathCreateMutable();
        let firstRect = CGRect(x: 55, y: 60, width: 150, height: 150);
        CGPathAddRect(path, nil, firstRect);
        CGContextAddPath(context, path);
        UIColor(red: 1, green: 0.5, blue: 0.7, alpha: 1.0).setFill();
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke);
    }
    
    func transformView(){
        let path = CGPathCreateMutable();
        let rectangle = CGRect(x: 10, y: 30, width: 200, height: 300);
        var transform = CGAffineTransformMakeTranslation(30, 30);
        CGPathAddRect(path, &transform, rectangle);
        let context = UIGraphicsGetCurrentContext();
        CGContextAddPath(context, path);
        UIColor(red: 0.20, green: 0.60, blue: 0.80, alpha: 1.0).setFill();
        UIColor.brownColor().setStroke();
        CGContextSetLineWidth(context, 5)
        CGContextDrawPath(context, CGPathDrawingMode.FillStroke);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}