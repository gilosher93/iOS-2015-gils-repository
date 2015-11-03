//
//  ViewController.swift
//  Accepting User Text Input With UITextField
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField: UITextField!;
    var label:UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 35));
        textField.center = view.center;
        textField.borderStyle = .RoundedRect;
        textField.contentVerticalAlignment = .Center;
        textField.textAlignment = .Center;
        textField.placeholder = "Enter Text";
        textField.delegate = self;
        view.addSubview(textField);
        
        label = UILabel(frame: CGRect(x: textField.frame.origin.x, y: textField.frame.maxY, width: 220, height: 35));
        view.addSubview(label);
        calculateAndDisplayTextFieldLengthWithText(textField.text!);
        label.textColor = UIColor.redColor();
        
        
    }
    
    func calculateAndDisplayTextFieldLengthWithText(text: String){
        var characterOrCharacters = "Character";
        let l = (text as NSString).length;
        if(l != 1){
            characterOrCharacters += "s";
        }
        label.text = "\(l) \(characterOrCharacters)";
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let text = textField.text! as NSString;
        let wholeText = text.stringByReplacingCharactersInRange(range, withString: string);
        if(wholeText as NSString).length > 10{
            return false;
        }
        calculateAndDisplayTextFieldLengthWithText(wholeText);
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

