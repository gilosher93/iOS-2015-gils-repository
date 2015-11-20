//
//  ViewController.swift
//  Uploading Data Using NSURLSession
//
//  Created by גיל אושר on 19.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController , NSURLSessionDelegate , NSURLSessionDataDelegate{
    
    var session: NSURLSession!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
        configuration.timeoutIntervalForRequest = 15.0;
        
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil);
        
        var dataToUpload = "gil always right".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false);
        
        let dictionary: [NSString : AnyObject] = [
            "UserName" : "Guy",
            "Password" : "12345",
            "Friend" : ["FirstName" : "Gil" , "LastName" : "Osher"]
        ];
        
        do{
            dataToUpload = try NSJSONSerialization.dataWithJSONObject(dictionary, options: NSJSONWritingOptions.PrettyPrinted) //PrettyPrinted means the propper syntax of JSON
        }catch{
            
        }
        
        
        
        let url = NSURL(string: "http://10.0.0.92:8080/MainServlet");
        
        let request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST"; //the defult is GET
        request.setValue("text", forKey: "key");
        
        let task = session.uploadTaskWithRequest(request, fromData: dataToUpload!);
        
        task.resume();
    }
    
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        session.finishTasksAndInvalidate();
        print(error == nil ? "done." : "error");
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        let responseFromServer = NSString(data: data, encoding: NSUTF8StringEncoding);
        if let theResponseFromServer = responseFromServer{
            //print("Data from server: \(theResponseFromServer)");
            do{
                let jsonObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments);
                if jsonObject is NSDictionary{
                    let deserializedDictionary = jsonObject as! NSDictionary;
                    let key1 = deserializedDictionary["key1"];
                    print("key1 = \(key1!)")
                }
            }catch{
                
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

