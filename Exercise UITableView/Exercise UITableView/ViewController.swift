//
//  ViewController.swift
//  Exercise UITableView;
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView?;
    var persons = [Person(name: "אריק", age: 22) , Person(name: "גיל", age: 28) , Person(name: "מאיר", age: 40) , Person(name: "עומר", age: 80) , Person(name: "ניר", age: 10) , Person(name: "ארלה", age: 18) , ]
    var addButton = UIButton(type: UIButtonType.Custom);
    var addYearButton = UIButton(type: UIButtonType.Custom);
    var removeYearButton = UIButton(type: UIButtonType.Custom);
    var controller: UIAlertController?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.grayColor();
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height-50), style: UITableViewStyle.Grouped);
        if let theTableView = tableView{
            theTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier");
            theTableView.dataSource = self;
            theTableView.delegate = self;
            let autoResizing = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleWidth.rawValue | UIViewAutoresizing.FlexibleHeight.rawValue);
            theTableView.autoresizingMask = autoResizing;
            view.addSubview(theTableView);
        }
        addButton.frame = CGRect(x: (view.frame.width-30)/2, y: tableView!.frame.maxY + 5, width: 30, height: 30);
        addButton.setBackgroundImage(UIImage(named: "plus"), forState: UIControlState.Normal);
        addButton.addTarget(self, action: "handleButton:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(addButton);
        
        addYearButton.frame = CGRect(x: 0, y: tableView!.frame.maxY, width: 150, height: 40);
        addYearButton.setTitle("שנה קדימה", forState: UIControlState.Normal);
        addYearButton.addTarget(self, action: "changeYear:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(addYearButton);
        
        removeYearButton.frame = CGRect(x: addButton.frame.maxX, y: tableView!.frame.maxY, width: 150, height: 40);
        removeYearButton.setTitle("שנה אחורה", forState: UIControlState.Normal);
        removeYearButton.addTarget(self, action: "changeYear:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(removeYearButton);
        
    }
    func changeYear(sender: UIButton){
        if sender == addYearButton{
            for i in 0..<persons.count{
                self.persons[i]._age++;
             }
        }else{
            for i in 0..<persons.count{
                if(self.persons[i]._age > 1){
                    self.persons[i]._age--;
                }

            }
        }
        self.tableView!.reloadData();
    }
    func handleButton(sender: UIButton){
        controller = UIAlertController(title: "הוסף אדם חדש לרשימה", message: "", preferredStyle: UIAlertControllerStyle.Alert);
        controller!.addTextFieldWithConfigurationHandler { (txtName: UITextField) -> Void in
            txtName.placeholder = "הכנס שם";
            txtName.textAlignment = NSTextAlignment.Right;
        }
        controller!.addTextFieldWithConfigurationHandler { (txtAge: UITextField) -> Void in
            txtAge.placeholder = "הכנס גיל";
            txtAge.textAlignment = NSTextAlignment.Right;
        }
        let actionOk = UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default) { (action: UIAlertAction) -> Void in
            if let textFields = self.controller!.textFields{
                let name = String(textFields[0].text!);
                let age = Int(textFields[1].text!);
                if(name as NSString).length != 0 && age != nil {
                    self.persons.append(Person(name: name, age: age!));
                    print(self.persons[self.persons.count-1].description());
                    self.tableView?.reloadData();
                }
            }
        }
        let actionCancel = UIAlertAction(title: "ביטול", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            
        }
        controller!.addAction(actionOk);
        controller!.addAction(actionCancel);
        presentViewController(controller!, animated: true, completion: nil)
    }
    
    /* */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count;
    }
    
    /* hide the status bar! */
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    func newLabelWithTitle(title: String) -> UILabel{
        let label = UILabel();
        label.text = title;
        label.textAlignment = .Center;
        label.backgroundColor = UIColor.clearColor();
        label.sizeToFit();
        return label;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return newLabelWithTitle("numbers of Persons: \(persons.count)")
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return newLabelWithTitle("Persons")
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete;
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated);
        tableView?.setEditing(editing, animated: animated);
        tableView?.reloadData();
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        persons.removeAtIndex(indexPath.row);
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left);
        tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath);
        cell.textLabel?.text = persons[indexPath.row].description();
        if(persons[indexPath.row]._age > 120){
            cell.backgroundColor = UIColor.redColor();
            cell.textLabel?.text = persons[indexPath.row].description() + " נפטר";
        }else if(persons[indexPath.row]._age > 70){
            cell.backgroundColor = UIColor.orangeColor();
            cell.textLabel?.text = persons[indexPath.row].description() + " עומד למות";
        }else if(persons[indexPath.row]._age > 23){
            cell.backgroundColor = UIColor.brownColor()
            cell.textLabel?.text = persons[indexPath.row].description() + " גיל ההתבגרות";
        }else{
            cell.backgroundColor = UIColor.greenColor();
            cell.textLabel?.text = persons[indexPath.row].description() + " צעיר";
        }
        return cell;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

    