//
//  ViewController.swift
//  Log In Page
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wallpaper: UIImageView!;
    var btnLogin: UIButton!;
    var btnSignin: UIButton!;
    var controller: UIAlertController!;
    var singinController: UIAlertController!;
    var users: [User] = [User]();
     
    override func viewDidLoad() {
        super.viewDidLoad()
        wallpaper = UIImageView(frame: view.bounds);
        wallpaper.image = UIImage(named: "hand");
        wallpaper.contentMode = UIViewContentMode.ScaleAspectFit;
        wallpaper.center = view.center;
        view.addSubview(wallpaper);
        let btn1 = UIImage(named: "red_button");
        btnLogin = UIButton(type: UIButtonType.Custom);
        
        // we can put the button where ever I want in the screen using view frame width/height.
        /*
        let x = (view.frame.width - 100) / 2;
        let y = (view.frame.height - 40) / 3;
        */
        btnLogin.frame = CGRect(x: 170, y: 450, width: 100, height: 50);
        btnLogin.setTitle("התחבר", forState: UIControlState.Normal);
        btnLogin.setBackgroundImage(btn1, forState: UIControlState.Normal);
        btnLogin.addTarget(self, action: "loginAlert:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btnLogin);
        let btn2 = UIImage(named: "gray_button");
        btnSignin = UIButton(type: UIButtonType.System);
        btnSignin.frame = CGRect(x: 63, y: 452, width: 90, height: 43);
        btnSignin.setTitle("הירשם", forState: UIControlState.Normal);
        btnSignin.setBackgroundImage(btn2, forState: UIControlState.Normal);
        btnSignin.addTarget(self, action: "signinAlert:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(btnSignin);

    }
    
    func loginAlert(sender: UIButton){
        controller = UIAlertController(title: "התחברות", message: "אנא הכנס שם משתמש וסיסמא", preferredStyle: UIAlertControllerStyle.Alert);
        
        //add edit text to the popUpAlert
        controller!.addTextFieldWithConfigurationHandler { (userName: UITextField) -> Void in
            userName.placeholder = "הכנס שם משתמש";
            userName.textAlignment = NSTextAlignment.Right;
        }
        controller!.addTextFieldWithConfigurationHandler { (password:UITextField) -> Void in
            password.placeholder = "הכנס סיסמא";
            password.textAlignment = NSTextAlignment.Right;
            
        }
        let cancelAction = UIAlertAction(title: "ביטול", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            
        }
        let loginAction = UIAlertAction(title: "התחבר", style: UIAlertActionStyle.Default) { [weak self](action: UIAlertAction) -> Void in
            if let textFields = self!.controller!.textFields{
                let userName = textFields[0].text;
                if let theUserName = userName{
                    let password = textFields[1].text;
                    if let thePassword = password{
                        let loginSuccess = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert);
                        if (theUserName as NSString).length != 0 && (thePassword as NSString).length != 0{
                            var userFound = false;
                            for user in self!.users{
                                if(theUserName == user.userName && thePassword == user.password){
                                    userFound = true;
                                    loginSuccess.title = "ברוך הבא \(userName!)";
                                    break;
                                }
                            }
                            if(!userFound){
                                loginSuccess.title = "התחברות נכשלה";
                                loginSuccess.message = "שם משתמש או סיסמא שגויים";
                            }
                        }else{
                            loginSuccess.title = "שגיאה"
                            loginSuccess.message = "אנא וודא שמילאת את כל הפרטים";
                        }
                        let actionOk = UIAlertAction(title: "אישור", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
                            
                        })
                        loginSuccess.addAction(actionOk);
                        self!.presentViewController(loginSuccess, animated: true, completion: nil);
                    }
                }
                
            }
        }
        controller.addAction(loginAction);
        controller.addAction(cancelAction);
        presentViewController(controller!, animated: true, completion: nil);
    }
    
    func signinAlert(sender: UIButton){
        controller = UIAlertController(title: "הרשמה", message: "אנא הכנס שם משתמש וסיסמא", preferredStyle: UIAlertControllerStyle.Alert);
        controller!.addTextFieldWithConfigurationHandler { (userName: UITextField) -> Void in
            userName.placeholder = "הכנס שם משתמש";
            userName.textAlignment = NSTextAlignment.Right;
        }
        controller!.addTextFieldWithConfigurationHandler { (password:UITextField) -> Void in
            password.placeholder = "הכנס סיסמא";
            password.textAlignment = NSTextAlignment.Right;
            
        }
        let cancelAction = UIAlertAction(title: "ביטול", style: UIAlertActionStyle.Cancel) { (action: UIAlertAction) -> Void in
            
        }
        let signinAction = UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default) { [weak self](action: UIAlertAction) -> Void in
            if let textFields = self!.controller!.textFields{
                let userName = textFields[0].text;
                if let theUserName = userName{
                    let password = textFields[1].text;
                    if let thePassword = password{
                        let signinOption = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.Alert);
                        if (theUserName as NSString).length != 0 && (thePassword as NSString).length != 0{
                            self!.users.append(User(userName: theUserName, password: thePassword));
                                signinOption.title = "נרשמת בהצלחה";
                                signinOption.message = "שם משתמש: \(theUserName) סיסמא: \(thePassword)";
                        }else{
                            signinOption.title = "שגיאה"
                            signinOption.message = "אנא וודא שמילאת את כל הפרטים";
                        }
                        let actionOk = UIAlertAction(title: "אישור", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
                            
                        })
                        signinOption.addAction(actionOk);
                        self!.presentViewController(signinOption, animated: true, completion: nil);
                    }
                }
                
            }
        }
        controller.addAction(signinAction);
        controller.addAction(cancelAction);
        presentViewController(controller!, animated: true, completion: nil);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

