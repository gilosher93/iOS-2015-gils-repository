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
        
        /*
        let fileManager = NSFileManager();
        let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask);
        
        if urls.count > 0 {
        let documentsFolder = urls[0];
        print("documentsFolder = \(documentsFolder)");
        }
        */
        
        /* path for temp directory */
        let tempDirectory = NSTemporaryDirectory();
        //print("tempDirectory = \(tempDirectory)");
        
        
        let someText = NSString(string: "some text we want to save to file2");
        let destinationPath = NSTemporaryDirectory() + "MyFile.txt";
        
        do{
            /*
            try someText.writeToFile(destinationPath, atomically: true, encoding: NSUTF8StringEncoding);
            let readString = try NSString(contentsOfFile: destinationPath, encoding: NSUTF8StringEncoding);
            print(readString);
            
            let arrayOfNames:NSArray = ["Gil", "Ariel", "Guy"];
            arrayOfNames.writeToFile(destinationPath, atomically: true);
            
            let arrayOfNamesFromFile = NSArray(contentsOfFile: destinationPath);
            for i in 0 ..< arrayOfNamesFromFile!.count {
                let name = arrayOfNamesFromFile![i] as! String;
                print(name);
            }

            
            let tempPath = NSTemporaryDirectory() as NSString;
            let imagesPath = tempPath.stringByAppendingPathComponent("images");
            try NSFileManager().createDirectoryAtPath(imagesPath, withIntermediateDirectories: true, attributes: nil);
            //if folder exists, the above code does nothing
            
            /* how to get a list of folder and files that exist in a certain folder */

            let propertiesToGet = [
                NSURLIsDirectoryKey, //if it's folder
                NSURLIsReadableKey, //if the file is readable
                NSURLCreationDateKey, //what is the creation date
                NSURLContentAccessDateKey,//when the file or directory was last opened
                NSURLContentModificationDateKey, //when the file or directory was last changed
            ]
            //let directoryContent = try NSFileManager().contentsOfDirectoryAtPath(NSTemporaryDirectory());
            
            let directoryContent = try NSFileManager().contentsOfDirectoryAtURL(NSURL(string: NSTemporaryDirectory())!, includingPropertiesForKeys: propertiesToGet, options: .SkipsHiddenFiles);
            for url in directoryContent{
                printUrlProperties(url);
            }
            
            
            /* how to remove file or directory */
            let destinationPath = ((NSTemporaryDirectory() as! NSString).stringByAppendingPathComponent("images") as! NSString).stringByAppendingPathComponent("MyFile.txt");
            try NSFileManager().removeItemAtPath(destinationPath);
            print("MyFile.txt was deleted");
            */
            
            let destinationPath = NSTemporaryDirectory() + "person.txt";
            let p1 = Person(firstName: "Gil", lastName: "Osher");
            let d1 = Dog(color: "blue", owner: p1);
            NSKeyedArchiver.archiveRootObject(d1, toFile: destinationPath);
            
            let d2 = NSKeyedUnarchiver.unarchiveObjectWithFile(destinationPath) as! Dog;
            print("\(d2.color) \(d2.owner.firstName)");
            print(destinationPath);
        }catch{
            print("in catch")
        }
        
        
        
        // NSString, NSDictionary, NSArray, NSData, NSNumber, NSDate
        
    }
    func printUrlProperties(url: NSURL){
        print(url.absoluteString)
        var value: AnyObject?;
        do{
            try url.getResourceValue(&value, forKey: NSURLIsDirectoryKey);
            let number = value as! NSNumber;
            let isDirectory = number.boolValue;
            if isDirectory{
                print("this is directory");
            }else{
                print("this is NOT directory");
            }
            try url.getResourceValue(&value, forKey: NSURLCreationDateKey);
            let creationDate = value as! NSDate;
            print("creation date \(creationDate)");
        }catch{
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

