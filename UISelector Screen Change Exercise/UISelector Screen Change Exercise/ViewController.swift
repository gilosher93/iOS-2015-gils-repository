//
//  ViewController.swift
//  UISelector Screen Change Exercise
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControl: UISegmentedControl!;
    var imageView: UIImageView!;
    var images: [UIImageView]!;
    var views: [UIView]!;
    var container: UIView!;
    override func viewDidLoad() {
        super.viewDidLoad();
        images = [UIImageView]();
        views = [UIView]();
        for _ in 0..<4{
            images.append(UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)));
            views.append(UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)));
        }
        container = UIView(frame: CGRect(x: 0, y: 35, width: view.frame.width, height: view.frame.height));
        for i in 0..<views.count{
            images[i].image = UIImage(named: "minion\(i+1)");
            print("minion\(i+1)")
            views[i].addSubview(images[i]);
            views[i].hidden = true;
            container.addSubview(views[i]);
        }
        let segments = ["1" , "2" , "3" , "4"];
        
        segmentControl = UISegmentedControl(items: segments);
        segmentControl.frame = CGRect(x: (view.frame.width-300)/2, y: 20, width: 300, height: 30);
        view.addSubview(container);
        view.addSubview(segmentControl);
        
        segmentControl.addTarget(self, action: "segmentedControlValueChanged:", forControlEvents: UIControlEvents.ValueChanged);
    }
    
    func segmentedControlValueChanged(sender: UISegmentedControl){
        let index = sender.selectedSegmentIndex;
        for i in 0..<views.count{
            views[i].hidden = (i != index);
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
