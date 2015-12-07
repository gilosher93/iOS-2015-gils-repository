//
//  ViewController.swift
//  Using StoryBoard
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtInput.delegate = self;
    }

    @IBAction func handleClick(sender: AnyObject) {
        lblTitle.text = txtInput.text;
        txtInput.resignFirstResponder();
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

