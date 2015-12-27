//
//  DatePickerViewDelegate.swift
//  Picker View Exercise
//
//  Created by גיל אושר on 27/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class DatePickerViewDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let monthNames = ["January", "Februrary", "March", "April", "May", "June", "July", "August", "September", "October", "November" ,"December"];
    let daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    let weekDays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var currentlySelectedMoth: Int = 0;
    var currentlySelectedDay:Int = 0;
    
    
    override init(){
        //we want the initial date selected to be of today
        let today = NSDate();
        let todayMonth = NSCalendar.currentCalendar().component(NSCalendarUnit.Month, fromDate: today) - 1;
        let todayDay = NSCalendar.currentCalendar().component(NSCalendarUnit.Day, fromDate: today) - 1;
        currentlySelectedMoth = todayMonth;
        currentlySelectedDay = todayDay;
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component == 0){
            return 12;
        }else{
            return daysInMonth[currentlySelectedMoth];
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component == 0){
            return monthNames[row];
        }else{
            return "\(row + 1)";
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            
            let shouldReload = daysInMonth[row] != daysInMonth[currentlySelectedMoth];
            currentlySelectedMoth = row;
            if shouldReload{
                pickerView.reloadComponent(1);
            }
            
        }else{
            currentlySelectedDay = row;
            
        }
    }
    
    func getWeekDayOfCurrentlySelectedDate()->String{
        var sum = 0;
        for i in 0 ..< currentlySelectedMoth{
            sum += daysInMonth[i];
        }
        sum += currentlySelectedDay;
        return weekDays[(sum + 4) % 7];
    }
}