//
//  ViewController.swift
//  Accelerometer Exercise
//
//  Created by גיל אושר on 14.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var ball: UIView!;
    lazy var motionManager = CMMotionManager();
    var velocityX: Double = 0;
    var velocityY: Double = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        ball = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40));
        ball.center = view.center;
        ball.backgroundColor = UIColor(red: 0, green: 122.0 / 255.0, blue: 255.0, alpha: 1.0);
        ball.layer.cornerRadius = 20;
        view.addSubview(ball)
        if motionManager.accelerometerAvailable{
            print("accelerometer is availble");
            if motionManager.accelerometerActive == false{
                print("accelerometer is active");
                let queue = NSOperationQueue();
                motionManager.startAccelerometerUpdatesToQueue(queue, withHandler: { [weak self](data: CMAccelerometerData?, error: NSError?) -> Void in
                    print("x= \(data!.acceleration.x)")
                    print("y= \(data!.acceleration.y)")
                    
                    self!.velocityX = data!.acceleration.x + Double(self!.ball.frame.origin.x);
                    self!.velocityY = Double(self!.ball.frame.origin.y) - data!.acceleration.y;
                    if self!.ball.frame.origin.x > 0 && self!.ball.frame.origin.x < self!.view.frame.width - 42 && self!.ball.frame.origin.y > 0 && self!.ball.frame.origin.y < self!.view.frame.height - 42{
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self!.ball.frame.origin.x = CGFloat(self!.velocityX);
                            self!.ball.frame.origin.y = CGFloat(self!.velocityY);
                            //print("ball x = \(self!.ball.frame.origin.x)")
                            //print("ball y = \(self!.ball.frame.origin.y)")
                            //print("view width - 40 = \(self!.view.frame.width - 40)")
                        })
                    }
                });
            }
        }
        ball.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "panGesture:"))
    }
    
    func panGesture(sender: UIPanGestureRecognizer){
        if sender.state != .Ended && sender.state != .Failed{
            let location = sender.locationInView(sender.view!.superview);
            sender.view!.center = location;
        }
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake{
            print("shake");
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

