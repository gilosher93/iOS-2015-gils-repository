//
//  ViewController.swift
//  Using UISegmentedControl
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl: UISegmentedControl!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
    
        let segments = ["iPhone" , "iPad" , "iWatch" , "iMac"];
        
        segmentControl = UISegmentedControl(items: segments);
        segmentControl.center = view.center;
        
        view.addSubview(segmentControl);
        
        segmentControl.addTarget(self, action: "segmentedControlValueChanged:", forControlEvents: UIControlEvents.ValueChanged);
    }
    
    func segmentedControlValueChanged(sender: UISegmentedControl){
        let selectedSegmentIndex = sender.selectedSegmentIndex;
        let selectedSegmentText = sender.titleForSegmentAtIndex(selectedSegmentIndex);
        
        var text = "[no text]";
        if let theSelectedSegmentText =  selectedSegmentText{
            text = theSelectedSegmentText;
        }
        print("Segment \(selectedSegmentIndex+1) with text \(text)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

