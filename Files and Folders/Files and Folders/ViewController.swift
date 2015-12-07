//
//  ViewController.swift
//  Files and Folders
//
//  Created by גיל אושר on 3.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = NSFileManager();
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask);
        if urls.count > 0 {
            let documentsFolder = urls[0];
            //print("documentsFolder = \(documentsFolder)")
        }
        
        let tempDirectory = NSTemporaryDirectory();
        //print("tempDirectory: \(tempDirectory)");
        
        let someText = NSString(string: "some text we want to save to file");
        let destinationPath = NSTemporaryDirectory() + "MyFile.txt";
        do{
            print(destinationPath)
            try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding);
        }catch{
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

