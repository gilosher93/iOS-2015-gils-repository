//
//  ViewController.swift
//  Exercise In TextField
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    
    var textField: UITextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 35));
        textField.delegate = self;
        textField.placeholder = "הכנס מספר תקין";
        textField.borderStyle = .RoundedRect;
        textField.center = view.center;
        view.addSubview(textField);
        
    }
    func checkIfValid(text: String) -> Bool{
        if(!checkForDigit(text) && !checkForPoint(text)){
            return false;
        }
        return true;
    }
    func checkForDigit(stringToCheck: String) ->Bool{
        let theText = (stringToCheck as NSString);
        for i in 0..<theText.length{
            let char = Int(theText.characterAtIndex(i));
            if(char < 48 || char > 57){
                return false;
            }
        }
        return true;
    }
    func checkForPoint(stringToCheck: String) ->Bool{
        let theText = (stringToCheck as NSString);
        for i in 0..<theText.length{
            let char = Int(theText.characterAtIndex(i));
            if(char == 46){
                return true;
            }
        }
        return false;
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        if !checkIfValid(string){
            return false;
        }
        
        let text = textField.text! as NSString;
        let str = string as NSString;
        
        let ch = text.length == 0 ? str.characterAtIndex(0) : text.characterAtIndex(0);
        if ch == 48 || ch == 46{
            return false;
        }
        if(checkForPoint(text as String) && checkForPoint(string)){
            if str.length == 0 && text.characterAtIndex(text.length-1) == 46{
                return true;
            }
           return checkForDigit(string);
        }
        return true;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

