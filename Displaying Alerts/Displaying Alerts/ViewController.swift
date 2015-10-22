//
//  ViewController.swift
//  Displaying Alerts
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var controller: UIAlertController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = UIAlertController(title: "Warning", message: "Battery Low!", preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            print("the ok button was trapped");
        }
        controller!.addAction(action);
        
        controller!.addTextFieldWithConfigurationHandler { (textField: UITextField) -> Void in
            textField.placeholder = "הכנס שם";
        }
        
        let actionNext = UIAlertAction(title: "Next", style: UIAlertActionStyle.Default) {
            [weak self](action: UIAlertAction) -> Void in
            if let textFileds = self!.controller!.textFields{
                let userName = textFileds[0].text
                if let theUserName = userName{
                    if(theUserName as NSString).length > 3 {
                        print("your user name is \(theUserName)")
                    }else{
                        print("your userName length is too short")
                    }
                }
            }
        }
        controller!.addAction(actionNext);
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        presentViewController(controller!, animated: true, completion: nil);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

