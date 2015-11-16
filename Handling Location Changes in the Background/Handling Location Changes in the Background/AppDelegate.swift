//
//  AppDelegate.swift
//  Handling Location Changes in the Background
//
//  Created by Elad Lavi on 12/11/2015.
//  Copyright © 2015 Elad Lavi. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    
    var locationManager: CLLocationManager!;
    var isExecutingInBackground = false;


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        locationManager = CLLocationManager();
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.delegate = self;
        locationManager.startUpdatingLocation();
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        isExecutingInBackground = true;
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters; //CPU is lower
    }

    func applicationWillEnterForeground(application: UIApplication) {
        isExecutingInBackground = false;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        
        print("didUpdateToLocation");
        if isExecutingInBackground{
            /* don't update UI, don't do heavy processing  */
        }else{
            /* feel free to do heavy processing */
            
            let notification = NSNotification(name: "locationUpdated", object: nil, userInfo: ["lat" : newLocation.coordinate.latitude, "long" : newLocation.coordinate.longitude]);
            NSNotificationCenter.defaultCenter().postNotification(notification);
        }
        
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

