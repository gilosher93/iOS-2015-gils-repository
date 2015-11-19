//
//  ViewController.swift
//  Gesture Recognizer
//
//  Created by גיל אושר on 16.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /* Swipe */
    var swiperRecognizer: UISwipeGestureRecognizer!;
    
    /* Rotation */
    var label: UILabel!;
    var rotationRecognizer: UIRotationGestureRecognizer!;
    var rotationAngleRadians = 0.0 as CGFloat;
    
    /* Pan - like a Drag */
    var panGestureRecognizer: UIPanGestureRecognizer!;
    
    /* Long Press */
    var longPressGestureRecognizer: UILongPressGestureRecognizer!;
    
    /* Tap */
    var tapGestureRecognizer: UITapGestureRecognizer!;
    
    /* Pinch */
    var pinchGestureRecognizer: UIPinchGestureRecognizer!;
    var currentScale:CGFloat = 0.0;
    
    /* Edge */
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!;
    
    
    var menuView: UIView;
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        //SWIPE
        swiperRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipes:");
        swiperRecognizer.direction = .Left;
        swiperRecognizer.numberOfTouchesRequired = 1;
        view.addGestureRecognizer(swiperRecognizer);
        */
        menuView = UIView(frame: CGRect(x: -200, y: 0, width: 220, height: view.frame.height))
            
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
        label.backgroundColor = UIColor.brownColor();
        label.textAlignment = .Center;
        label.text = "Hello World!";
        label.font = UIFont.systemFontOfSize(16);
        //label.sizeToFit(); //like wrap_content...
        label.center = view.center;
        label.userInteractionEnabled = true;
        view.addSubview(label);
        
        /*
        //ROTATION
        rotationRecognizer = UIRotationGestureRecognizer(target: self, action: "handleRotations:");
        view.addGestureRecognizer(rotationRecognizer);
        */

        /*
        //PAN
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        panGestureRecognizer.minimumNumberOfTouches = 1;
        panGestureRecognizer.maximumNumberOfTouches = 1;
        label.addGestureRecognizer(panGestureRecognizer);
        */
        
        /*
        //LONG PRESS
        longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "handleLongPressGesture:");
        
        /* The number of fingers that must be present on the screen */
        longPressGestureRecognizer.numberOfTouchesRequired = 2;
        
        /* Maximum 100 point of movement allowed before the gesture is recognized */
        longPressGestureRecognizer.allowableMovement = 100;
        
        /* the user must press 2 fingers for at least 1 second for the gesture to be recognizer */
        longPressGestureRecognizer.minimumPressDuration = 1;
        
        /* a long press on a apoint on the screen should relocate the label to the point */
        view.addGestureRecognizer(longPressGestureRecognizer);
        */
        
        /*
        //TAP
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTaps:");
        tapGestureRecognizer.numberOfTouchesRequired = 2;
        tapGestureRecognizer.numberOfTapsRequired = 3;
        view.addGestureRecognizer(tapGestureRecognizer);
        */
        
        /*
        //PINCH
        pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: "handlePinch:");
        label.addGestureRecognizer(pinchGestureRecognizer);
        */
        
        //EDGE
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "handleScreenEdgePan:");
        screenEdgeRecognizer.edges = .Left;
        view.addGestureRecognizer(screenEdgeRecognizer);
    }
    
    func handleSwipes(sender: UISwipeGestureRecognizer){
        print("swipe left")
    }
    
    func handleRotations(sender: UIRotationGestureRecognizer){
        label.transform = CGAffineTransformMakeRotation(rotationAngleRadians + sender.rotation);
        if sender.state == .Ended{
            rotationAngleRadians += sender.rotation;
        }
    }
    
    func handlePanGesture(sender: UIPanGestureRecognizer){
        if sender.state != .Ended && sender.state != .Failed{
            let location = sender.locationInView(sender.view!.superview);
            sender.view!.center = location;
        }
    }
    
    func handleLongPressGesture(sender: UILongPressGestureRecognizer){
        if sender.numberOfTouches() == 2{
            let touchPoint1 = sender.locationOfTouch(0, inView: sender.view);
            let touchPoint2 = sender.locationOfTouch(1, inView: sender.view);
            
            let midPointX = (touchPoint1.x + touchPoint2.x) / 2.0;
            let midPointY = (touchPoint1.y + touchPoint2.y) / 2.0;
            
            let midPoint = CGPoint(x: midPointX, y: midPointY);
            
            label.center = midPoint;
        }
    }
    
    func handleTaps(sender: UITapGestureRecognizer){
        for touchCounter in 0 ..< sender.numberOfTouchesRequired {
            let touchPoint = sender.locationOfTouch(touchCounter, inView: sender.view);
            print("Touch \(touchCounter + 1): \(touchPoint)");
        }
    }
    
    func handlePinch(sender: UIPinchGestureRecognizer){
        print("inHandlePinch")
        if sender.state == .Ended{
            currentScale = sender.scale;
        }else if sender.state == .Began && currentScale != 0.0{
            sender.scale = currentScale;
        }
        
        if sender.scale != CGFloat.NaN && sender.scale != 0.0{
            sender.view!.transform = CGAffineTransformMakeScale(sender.scale, sender.scale);
        }
        
    }
    
    func handleScreenEdgePan(sender: UIScreenEdgePanGestureRecognizer){
        if sender.state == .Ended{
            print("Edge swipe was detected");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

