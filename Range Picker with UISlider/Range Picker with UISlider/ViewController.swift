//
//  ViewController.swift
//  Range Picker with UISlider
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var slider: UISlider!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        slider = UISlider(frame: CGRect(x: 0, y: 0, width: 200, height: 25));
        slider.center = view.center;
        slider.minimumValue = 0;
        slider.maximumValue = 100;
        slider.value = 50;
        view.addSubview(slider);
        slider.addTarget(self, action: "sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged);
        //slider.continuous = false; //valueChanged event do not trigger the event until the slider is released by the user.
        slider.setThumbImage(UIImage(named: "red_button_40"), forState: UIControlState.Normal);
        slider.setThumbImage(UIImage(named: "red_button_25"), forState: UIControlState.Highlighted)
    }
    
    func sliderValueChanged(slider: UISlider){
        print(" slider's value is: \(slider.value)");
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

