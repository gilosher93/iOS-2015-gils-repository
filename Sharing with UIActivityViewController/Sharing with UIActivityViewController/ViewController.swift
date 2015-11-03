//
//  ViewController.swift
//  Sharing with UIActivityViewController
//
//  Created by גיל אושר on 29.10.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var textField: UITextField!;
    var buttonShare: UIButton!;
    var activityViewController: UIActivityViewController!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        createTextField();
        createButton();
    }
    
    func createTextField(){
        textField = UITextField(frame: CGRect(x: 20, y: 35, width: 280, height: 30));
        textField.borderStyle = .RoundedRect;
        textField.placeholder = "Enter text to share...";
        textField.delegate = self;
        view.addSubview(textField);
    }
    
    func createButton(){
        buttonShare = UIButton(type: UIButtonType.System);
        buttonShare.frame = CGRect(x: 20, y: textField.frame.maxY + 10, width: 280, height: 45);
        buttonShare.setTitle("Share", forState: UIControlState.Normal);
        buttonShare.addTarget(self, action: "handleShare:", forControlEvents: UIControlEvents.TouchDown)
        view.addSubview(buttonShare);
    }
    
    func handleShare(sender: UIButton){
        if textField.isFirstResponder(){
            textField.resignFirstResponder();
        }
        
        //TODO: check that the user actually typed in something
        activityViewController = UIActivityViewController(activityItems: [textField.text! as NSString], applicationActivities: nil);
        presentViewController(activityViewController, animated: true, completion: nil)
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

