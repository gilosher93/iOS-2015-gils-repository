//
//  ViewController.swift
//  Downloading Data Using NSURL Session
//
//  Created by גיל אושר on 19.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

extension NSURLSessionTask{
    func start(){
        self.resume();
    }
}

class ViewController: UIViewController, NSURLSessionDelegate {
    
    var session: NSURLSession!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
        configuration.timeoutIntervalForRequest = 15.0;
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil);
        
        let url = NSURL(string: "http://www.ebay.com");
        
        let task = session.dataTaskWithURL(url!) { [weak self](data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            print("done. is main thread ? \(NSThread.isMainThread())");
            self!.session.finishTasksAndInvalidate();
            if error == nil{
                if let theData = data{
                    if theData.length > 0{
                        let responseAsString = NSString(data: theData, encoding: NSUTF8StringEncoding);
                        print(responseAsString);
                    }
                }
                
            }
        };
        task.start();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

