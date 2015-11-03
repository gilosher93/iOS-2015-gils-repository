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
    var thereIsPoint = false;
    
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
        let theText = (text as NSString);
        for i in 0..<theText.length{
            let char = Int(theText.characterAtIndex(i));
            if(char == 46){
                return !thereIsPoint;
            }else if (!checkForDigit(String(char))) {
                return false;
            }
        }
        return true;
    }
    func checkForDigit(stringToCheck: String) ->Bool{
        let theText = (stringToCheck as NSString);
        for i in 0..<theText.length{
            let char = Int(theText.characterAtIndex(i));
            if(char < 48 || char > 56){
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
        thereIsPoint = checkForPoint(text as String);
        if(thereIsPoint && checkForPoint(string)){
           return !checkForDigit(string);
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

