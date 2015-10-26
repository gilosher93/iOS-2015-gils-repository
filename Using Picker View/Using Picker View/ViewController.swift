//
//  ViewController.swift
//  Using Picker View
//
//  Created by גיל אושר on 26/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var dayPicker: UIPickerView!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        dayPicker = UIPickerView();
        dayPicker.center = view.center;
        dayPicker.dataSource = self;
        dayPicker.delegate = self;
        view.addSubview(dayPicker);
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == dayPicker{
            return 2;
        }
        return 0;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if pickerView == dayPicker{
            return 31;
        }
        return 0;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

