//
//  ViewController.swift
//  Accelerometer
//
//  Created by גיל אושר on 14.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    lazy var motionManager = CMMotionManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if motionManager.accelerometerAvailable{
            print("accelerometer is availble");
            if motionManager.accelerometerActive == false{
                print("accelerometer is active");
                let queue = NSOperationQueue();
                motionManager.startAccelerometerUpdatesToQueue(queue, withHandler: { (data: CMAccelerometerData?, error: NSError?) -> Void in
                    print("X:\(data!.acceleration.x)  Y:\(data!.acceleration.y)  Z:\(data!.acceleration.z)  ")
                });
            }
            
            
        }else{
            print("accelerometer is NOT availble");
        }
        
        if motionManager.accelerometerActive{
            print("accelerometer is active");
        }else{
            print("accelerometer is NOT active");
        }
        
        if motionManager.gyroAvailable{
            print("Gyroscope is available");
            if motionManager.gyroActive == false{
                motionManager.gyroUpdateInterval = 1.0 / 40.0 ; //40 updates per 1 second
                let queue = NSOperationQueue();
                motionManager.startGyroUpdatesToQueue(queue, withHandler: { (data: CMGyroData?, error: NSError?) -> Void in
                    print("x:\(data!.rotationRate.x)  y:\(data!.rotationRate.y)  z:\(data!.rotationRate.z) ");
                })
            }
        }else{
            print("Gyroscope is NOT available");
        }
        
        if motionManager.gyroActive{
            print("Gyroscope is active");
        }else{
            print("Gyroscope is NOT active");
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

