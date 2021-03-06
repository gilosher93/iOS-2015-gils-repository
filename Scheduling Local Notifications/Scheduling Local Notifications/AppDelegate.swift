//
//  AppDelegate.swift
//  Scheduling Local Notifications
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if let options = launchOptions{
            let value = options[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification;
            if let notification = value{
                
            }
        }
        /* First ask the user we are allowed to perform local notification */
        let settings = UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil);
        application.registerUserNotificationSettings(settings);
        
        //badge - the small number in the red circle near the app icon
        
        
        return true
    }

    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types.isEmpty{ //the user didn't allow any type of notification
            return;
        }
        let notification = UILocalNotification();
        notification.fireDate = NSDate(timeIntervalSinceNow: 5);
        notification.timeZone = NSCalendar.currentCalendar().timeZone;
        notification.alertBody = "you have a new message!";
        notification.hasAction = true;
        notification.alertAction = "show";
        notification.applicationIconBadgeNumber++;
        notification.userInfo = [
            "Key 1" : "Value 1",
            "Key 2" : "Value 2"
        ];
        application.scheduleLocalNotification(notification);
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

