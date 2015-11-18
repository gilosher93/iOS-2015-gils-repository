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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        swiperRecognizer = UISwipeGestureRecognizer(target: self, action: "handleSwipes:");
        swiperRecognizer.direction = .Left;
        swiperRecognizer.numberOfTouchesRequired = 1;
        view.addGestureRecognizer(swiperRecognizer);
        */
        
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
        label.textAlignment = .Center;
        label.text = "Hello World!";
        label.font = UIFont.systemFontOfSize(16);
        label.sizeToFit(); //like wrap_content...
        label.center = view.center;
        view.addSubview(label);
        
        
        rotationRecognizer = UIRotationGestureRecognizer(target: self, action: "handleRotations:");
        view.addGestureRecognizer(rotationRecognizer);

        
        panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        panGestureRecognizer.minimumNumberOfTouches = 1;
        panGestureRecognizer.maximumNumberOfTouches = 1;
        label.addGestureRecognizer(panGestureRecognizer);
        label.userInteractionEnabled = true;
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

