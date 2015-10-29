//
//  ViewController2.swift
//  MultipleViewControllers
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var counter = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 30));
        label.text = "View Controller 2";
        label.center = view.center;
        label.textAlignment = .Center;
        view.addSubview(label);
        
        let button = UIButton(type: UIButtonType.System);
        button.frame = CGRect(x: (view.frame.width - 100) / 2, y: label.frame.maxY + 5, width: 100, height: 20);
        button.setTitle("Move", forState: UIControlState.Normal);
        button.addTarget(self, action: "handleClick:", forControlEvents: UIControlEvents.TouchDown)
        view.addSubview(button);
        view.backgroundColor = UIColor.greenColor();
        print("2 : view did Load ");
    }
    func handleClick(sender: UIButton){
        dismissViewControllerAnimated(false, completion: nil)
    }
    override func viewDidAppear(animated: Bool) {
        print("2 : view did Appear \(counter)")
        counter++;
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("2 : view did Disappear")
    }

    

}

