//
//  ViewController.swift
//  Calculate Exercise
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{

    var txtNum1: UITextField!;
    var lblPlus: UILabel!;
    var txtNum2: UITextField!;
    var lblResult: UILabel!;
    var btnCalc: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtNum1.delegate = self;
        txtNum2.delegate = self;
    }
    @IBAction func showResult(sender: UIButton) {
        if (txtNum1.text! as NSString).length == 0 || (txtNum2.text! as NSString).length == 0 {
            showErrorController();
        }
        let result = Int(txtNum1.text!)! + Int(txtNum2.text!)!;
        txtNum1.resignFirstResponder();
        txtNum2.resignFirstResponder();
        lblResult.text = String(result);
    }
    func showErrorController(){
        let errorController = UIAlertController(title: "שגיאה", message: "אנא וודא שמילאת את כל הפרטים", preferredStyle: UIAlertControllerStyle.Alert);
        errorController.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
            
        }))
        presentViewController(errorController, animated: true, completion: nil)
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

