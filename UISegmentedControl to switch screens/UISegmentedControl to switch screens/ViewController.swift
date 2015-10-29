//
//  ViewController.swift
//  UISegmentedControl to switch screens
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl!;
    var containers = [UIView]();
    let margin: CGFloat = 5;
    let segments = ["screen 1" , "screen 2" , "screen 3" , "screen 4"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        createSegmentedControl();
        createContainer(0);
    }
    
    func segmentedControlValueChanged(sender: UISegmentedControl){
        let index = sender.selectedSegmentIndex;
        for i in 0..<segments.count{
            containers[i].hidden = i != index;
        }
    }
    
    func createSegmentedControl(){
        segmentedControl = UISegmentedControl(items: segments);
        segmentedControl.frame = CGRect(x: 5, y: 20, width: view.frame.width - 10, height: 30);
        segmentedControl.addTarget(self, action: "segmentedControlValueChanged:", forControlEvents: UIControlEvents.ValueChanged);
        view.addSubview(segmentedControl);
    }
    
    func createContainer(selected: Int){
        segmentedControl.selectedSegmentIndex = selected
        for i in 0..<segments.count{
            let container = UIView(frame: CGRect(x: margin, y: segmentedControl.frame.maxY, width: segmentedControl.frame.width, height: view.frame.height - (segmentedControl.frame.maxY + margin) - margin));
            containers.append(container);
            container.hidden = i != selected;
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30));
            label.text = segments[i];
            label.font = UIFont.boldSystemFontOfSize(20); //font size
            container.addSubview(label)
            view.addSubview(container);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

