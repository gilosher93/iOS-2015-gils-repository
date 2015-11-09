//
//  AppDelegate.swift
//  Learning NSTimer
//
//  Created by גיל אושר on 9.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var counter = 0;
    var window: UIWindow?
    var timer: NSTimer!;
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier = UIBackgroundTaskInvalid;
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        print("in didFinishLaunching...");
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "whatToDo:", userInfo: nil, repeats: true);
        backgroundTaskIdentifier = application.beginBackgroundTaskWithName("task1", expirationHandler: { [weak self]() -> Void in
            self!.endBackgroundTask();
        })
    }
    
    func whatToDo(timer: NSTimer){
        
        let backgroundTimeRemaining = UIApplication.sharedApplication().backgroundTimeRemaining;
        print("doing something... \(++counter) isMain = \(NSThread.currentThread().isMainThread)" );
        print("time remaining \(backgroundTimeRemaining)");
    }

    func endBackgroundTask(){
        timer.invalidate(); //stop the timer
        timer = nil; //make the GC(Garbich collector) collect the timer object
        UIApplication.sharedApplication().endBackgroundTask(backgroundTaskIdentifier);
        backgroundTaskIdentifier = UIBackgroundTaskInvalid;
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        if backgroundTaskIdentifier != UIBackgroundTaskInvalid{
            endBackgroundTask();
        }
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("in Terminate")
    }
    
    


}

