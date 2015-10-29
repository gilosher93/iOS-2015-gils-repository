//
//  ViewController.swift
//  Picking the Date and Time With UIDatePicker
//
//  Created by גיל אושר on 26/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var datePicker: UIDatePicker!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        datePicker = UIDatePicker();
        datePicker.center = view.center;
        datePicker.addTarget(self, action: "datePickerDateChanged:", forControlEvents: UIControlEvents.ValueChanged);
        
        view.addSubview(datePicker);
    }
    
    func datePickerDateChanged(sender: UIDatePicker){
        //get the date from the datePicker
        let chosenDate = datePicker.date;
        
        //get the hour from the date Using Calendar.
        let hour = NSCalendar.currentCalendar().component(NSCalendarUnit.Hour, fromDate: chosenDate);
        
        print("hour = \(hour)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

