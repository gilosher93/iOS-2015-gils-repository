//
//  AppDelegate.swift
//  Learning CoreLocation and MapKit
//
//  Created by גיל אושר on 16.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate , CLLocationManagerDelegate {

    var window: UIWindow?
    var locationDelegate: LocationDelegate?;
    var locationManager: CLLocationManager?;


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if CLLocationManager.locationServicesEnabled(){
            switch CLLocationManager.authorizationStatus(){
            case .AuthorizedAlways , .AuthorizedWhenInUse:
                createLocationManager(true);
                print("Authorized");
            case .Denied:
                print("Denied");
                // show alert controller to the user;
            case .NotDetermined:
                print("NotDetermined")
                createLocationManager(false);
                if let theLocationManager = locationManager{
                    theLocationManager.requestWhenInUseAuthorization();
                }
            case .Restricted:
                print("Restricted");
                //show appropriate alert controller
            }
        }else{
            print("Location service ")
        }
        
        return true
    }
    
    func createLocationManager(startImmediiately: Bool){
        locationManager = CLLocationManager();
        if let theLocationManager = locationManager{
            theLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
            theLocationManager.delegate = self;
            if(startImmediiately){
                theLocationManager.startUpdatingLocation();
            }
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status{
        case .AuthorizedAlways:
            print("AuthorizedAlways")// background
        case .AuthorizedWhenInUse:
            print("AuthorizedWhenInUse") //foreground
            if let theLocationManager = locationManager{
                theLocationManager.startUpdatingLocation();
            }
        case .Denied:
            print("Denied")
        case .NotDetermined:
            print("NotDetermined")
        case .Restricted:
            print("Restricted")
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("latitude = \(newLocation.coordinate.latitude)");
        print("longitude = \(newLocation.coordinate.longitude)");
        if let theLocationDelegate = locationDelegate{
            theLocationDelegate.locationChanged(newLocation.coordinate.latitude, longitude: newLocation.coordinate.longitude);
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


protocol LocationDelegate{
    func locationChanged(latitude: Double, longitude: Double);
}













