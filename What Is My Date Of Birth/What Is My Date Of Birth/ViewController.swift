//
//  ViewController.swift
//  What Is My Date Of Birth
//
//  Created by גיל אושר on 26/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var dayPicker: UIPickerView!;
    var month = Month(name: "select month", daysInMonth: 31);
    var months: [Month] = [Month]();
    var selectedMonth: Int = 1;
    var selectedDay: Int = 1;
    var button: UIButton!;
    var controller: UIAlertController!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        dayPicker = UIPickerView();
        dayPicker.center = view.center;
        dayPicker.dataSource = self;
        dayPicker.delegate = self;
        button = UIButton(type: UIButtonType.System);
        button.frame = CGRect(x: dayPicker.frame.origin.x + (dayPicker.frame.width / 2) - 50, y: dayPicker.frame.maxY, width: 100, height: 100);
        button.setBackgroundImage(UIImage(named: "red_button"), forState: UIControlState.Normal);
        button.addTarget(self, action: "calculateWhatDayIsIt:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(dayPicker);
        view.addSubview(button);
        initMonths();
        
        let today = NSDate();
        let todayMonth = NSCalendar.currentCalendar().component(NSCalendarUnit.Month, fromDate: today) - 1;
        let todayDay = NSCalendar.currentCalendar().component(NSCalendarUnit.Day, fromDate: today) - 1;
        selectedMonth = todayMonth;
        selectedDay = todayDay;
    }
    override func viewDidAppear(animated: Bool) {
        dayPicker.selectRow(selectedMonth, inComponent: 0, animated: animated);
        dayPicker.selectRow(selectedDay, inComponent: 1, animated: animated);

    }
    func initMonths(){
        months.append(Month(name: "ינואר", daysInMonth: 31));
        months.append(Month(name: "פברואר", daysInMonth: 28));
        months.append(Month(name: "מרץ", daysInMonth: 31));
        months.append(Month(name: "אפריל", daysInMonth: 30));
        months.append(Month(name: "מאי", daysInMonth: 31));
        months.append(Month(name: "יוני", daysInMonth: 30));
        months.append(Month(name: "יולי", daysInMonth: 31));
        months.append(Month(name: "אוגוסט", daysInMonth: 31));
        months.append(Month(name: "ספטמבר", daysInMonth: 30));
        months.append(Month(name: "אוקטובר", daysInMonth: 31));
        months.append(Month(name: "נובמבר", daysInMonth: 30));
        months.append(Month(name: "דצמבר", daysInMonth: 31));
    }
    func calculateWhatDayIsIt(sender: UIButton){
        var sum: Int = 0;
        let deltaMonths = selectedMonth - 1;
        print("delta month \(deltaMonths)");
        for i in 0..<deltaMonths{
            sum += months[i].daysInMonth;
        }
        let deltaDays = selectedDay - 1;
        print("delta day: \(deltaDays)")
        sum += deltaDays;
        var message = "";
        switch(sum%7){
        case 0:
        message = "חמישי";
        break;
        case 1:
        message = "שישי";
        break;
        case 2:
        message = "שבת";
        break;
        case 3:
        message = "ראשון";
        break;
        case 4:
        message = "שני";
        break;
        case 5:
        message = "שלישי";
        break;
        case 6:
        message = "רביעי";
        break;
        default:
            message = "";
        }
        controller = UIAlertController(title: "יום בשבוע", message: message, preferredStyle: UIAlertControllerStyle.Alert);
        controller.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            }
        );
        presentViewController(controller!, animated: true, completion: nil);
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if(component == 0){
            return 12;
        }else{
            return months[selectedMonth-1]._daysInMonth;
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dayPicker{
            if(component == 0){
                return months[row].name;
            }else{
                return "\(row + 1)";
            }
        }
        return " ";
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            let shoudReload = months[row].daysInMonth != months[selectedMonth-1].daysInMonth;
            selectedMonth = row+1;
            print("selected month \(selectedMonth)");
            if(shoudReload){
                pickerView.reloadComponent(1);
            }
        }else{
            selectedDay = row+1;
            print("selected day \(selectedDay)");
        }
    }
    
    class Month {
        var name: String;
        var daysInMonth: Int;
        
        init(name: String, daysInMonth: Int){
            self.name = name;
            self.daysInMonth = daysInMonth;
        }
        var _name: String{
            get{
                return name;
            }set{
                name = newValue;
            }
        }
        var _daysInMonth: Int{
            get{
                return daysInMonth;
            }set{
                daysInMonth = newValue;
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

