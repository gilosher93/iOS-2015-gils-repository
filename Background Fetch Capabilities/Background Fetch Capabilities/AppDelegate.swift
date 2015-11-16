//
//  AppDelegate.swift
//  Background Fetch Capabilities
//
//  Created by גיל אושר on 9.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var newsItems = [NewsItem]();
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum);
        
        return true;
    }
    
    static let newsItemsChangedNotification = "newsItemsChangedNotification";
    
    /*
    class func newsItemsChangedNotification()->String {
        return "\(__FUNCTION__)";
    }
    */
    
    func fetchNewsItem()->Bool{
        let item = NewsItem(date: NSDate(), text: "News Item \(newsItems.count + 1)");
        newsItems.append(item);
        NSNotificationCenter.defaultCenter().postNotificationName(AppDelegate.newsItemsChangedNotification, object: nil);
        
        return true;
        
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

