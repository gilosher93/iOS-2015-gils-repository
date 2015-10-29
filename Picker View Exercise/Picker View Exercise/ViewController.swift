//
//  ViewController.swift
//  Picker View Exercise
//
//  Created by גיל אושר on 27/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var picker: UIPickerView!;
    var btnShowDay: UIButton!;
    var datePickerViewDelegate: DatePickerViewDelegate!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        picker = UIPickerView();
        picker.center = view.center;
        datePickerViewDelegate = DatePickerViewDelegate();
        picker.delegate = datePickerViewDelegate;
        picker.dataSource = datePickerViewDelegate;
        picker.selectRow(datePickerViewDelegate.currentlySelectedMoth, inComponent: 0, animated: false);
        picker.selectRow(datePickerViewDelegate.currentlySelectedDay, inComponent: 1, animated: false);
        view.addSubview(picker);
        
        picker.frame.origin.y = 20;
        
        btnShowDay = UIButton(type: UIButtonType.System);
        btnShowDay.frame = CGRect(x: picker.frame.origin.x, y: picker.frame.maxY, width: 100, height: 35);
        btnShowDay.setTitle("show day", forState: UIControlState.Normal);
        btnShowDay.addTarget(self, action: "handleButtonShowDay:", forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btnShowDay);
        
    }
    
    func handleButtonShowDay(sender: UIButton){
        let controller = UIAlertController(title: "day in week", message: "the day is " + datePickerViewDelegate.getWeekDayOfCurrentlySelectedDate(), preferredStyle: UIAlertControllerStyle.Alert);
        controller.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil));
        presentViewController(controller, animated: true, completion: nil);
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}