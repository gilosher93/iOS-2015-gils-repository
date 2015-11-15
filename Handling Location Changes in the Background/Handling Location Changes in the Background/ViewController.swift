//
//  ViewController.swift
//  Handling Location Changes in the Background
//
//  Created by Elad Lavi on 12/11/2015.
//  Copyright © 2015 Elad Lavi. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate;
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleNewLocation:", name: "locationUpdated", object: nil);
        
        
    }
    
    func handleNewLocation(notification: NSNotification){
        print("lat: \(notification.userInfo!["lat"]), longitude: \(notification.userInfo!["long"])");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self);
    }


}

