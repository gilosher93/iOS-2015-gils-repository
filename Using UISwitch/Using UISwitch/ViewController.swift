//
//  ViewController.swift
//  Using UISwitch
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mainSwitch: UISwitch!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainSwitch = UISwitch(frame: CGRect(x: 200, y: 25, width: 0, height: 0));
        view.addSubview(mainSwitch);
        mainSwitch.addTarget(self, action: "switchIsChanged:", forControlEvents: UIControlEvents.ValueChanged);
        
        /* Edit Switch Color */
        mainSwitch.tintColor = UIColor.redColor(); //off-mode tint color
        mainSwitch.onTintColor = UIColor.blueColor(); //on-mode tint color
        mainSwitch.thumbTintColor = UIColor.yellowColor(); 
    }
    func switchIsChanged(sender: UISwitch){
        print("the value of the switch was changed to \(sender.on)");
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        mainSwitch.setOn(true, animated: true);
        if mainSwitch.on{
            /* switch is on */
        }else{
            /* switch is off */
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

