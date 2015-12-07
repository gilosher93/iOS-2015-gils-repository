//
//  Person.swift
//  Notification
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class Person: NSObject {
    var firstName: String?;
    var lastName: String?;
    
    init(firstName: String, lastName: String){
        self.firstName = firstName;
        self.lastName = lastName;
    }
    
    override init(){
        super.init();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleSetPersonInfoNotification:", name: AppDelegate.notificationName, object: UIApplication.sharedApplication().delegate);
    }
    
    func handleSetPersonInfoNotification(notification: NSNotification){
        firstName = notification.userInfo![AppDelegate.personInfoKeyFirstName] as! String;
        lastName = notification.userInfo![AppDelegate.personInfoKeyLastName] as! String;
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
}