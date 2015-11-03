//
//  ViewController.swift
//  Displaying Long Lines of Text with UITextView
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textView: UITextView?;
    let defaultContentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0);
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        textView = UITextView(frame: view.bounds);
        if let theTextView = textView{
            theTextView.text = "some text goes here...";
            theTextView.contentInset = defaultContentInset;
            theTextView.font = UIFont.systemFontOfSize(16);
            view.addSubview(theTextView);
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardDidShow:" , name: UIKeyboardDidShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleKeyboardWillHide:" , name: UIKeyboardWillHideNotification, object: nil);
    }
    
    func handleKeyboardDidShow(notification: NSNotification){
        /* get the frame of the keyboard */
        let keyboardRectAsObject = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue;
        
        /* Place it in a CGRect */
        var keyboardRect = CGRectZero;
        keyboardRectAsObject.getValue(&keyboardRect);
        
        /* Give a bottom margin to our text view that makes it reach to the top of the keyboard */
        textView!.contentInset = UIEdgeInsets(top: defaultContentInset.top, left: defaultContentInset.left, bottom: keyboardRect.height, right: defaultContentInset.right)
    }
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self); //removes all observers fot that pointer
    }
    func handleKeyboardWillHide(notification: NSNotification){
        textView!.contentInset = defaultContentInset;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

