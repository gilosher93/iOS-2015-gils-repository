//
//  ViewController.swift
//  MiniWhatsapp
//
//  Created by גיל אושר on 23.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDelegate, NSURLSessionDataDelegate{
    
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
    let url = NSURL(string: "http://10.0.0.194:8080/MainServlet");
    var request: NSMutableURLRequest!;
    var session: NSURLSession!;
    var tryToConnect = false;
    var txtUserName: UITextField!;
    var txtPassword: UITextField!;
    var wallpaper: UIImageView!;
    var btnLogin: UIButton!;
    var btnSignin: UIButton!;
    var controller: UIAlertController!;
    var singinController: UIAlertController!;
    var messageController: MessageController!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI();
        messageController = MessageController();
        configuration.timeoutIntervalForRequest = 15.0;
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil);
        request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST";
        
    }

    func initializeUI(){
        wallpaper = UIImageView(frame: view.bounds);
        wallpaper.image = UIImage(named: "hand");
        wallpaper.contentMode = UIViewContentMode.ScaleAspectFit;
        wallpaper.center = view.center;
        view.addSubview(wallpaper);
        
        
        // we can put the button where ever I want in the screen using view frame width/height.
        /*
        let x = (view.frame.width - 100) / 2;
        let y = (view.frame.height - 40) / 3;
        */
        
        txtUserName = UITextField(frame: CGRect(x: 0, y: 0, width: view.frame.width-100, height: 40))
        txtUserName.center = view.center;
        txtUserName.placeholder = "שם משתמש";
        txtUserName.textAlignment = .Right;
        txtUserName.borderStyle = .RoundedRect
        view.addSubview(txtUserName);
        
        txtPassword = UITextField(frame: CGRect(x: txtUserName.frame.origin.x, y: txtUserName.frame.maxY+5, width: view.frame.width-100, height: 40))
        txtPassword.placeholder = "סיסמא";
        txtPassword.textAlignment = .Right;
        txtPassword.borderStyle = .RoundedRect;
        view.addSubview(txtPassword);
        
        btnSignin = UIButton(type: UIButtonType.System);
        btnSignin.frame = CGRect(x: txtPassword.frame.origin.x, y: txtPassword.frame.maxY, width: 100, height: 50);
        btnSignin.setTitle("הירשם", forState: UIControlState.Normal);
        btnSignin.addTarget(self, action: "signinAlert:", forControlEvents: UIControlEvents.TouchUpInside)
        btnSignin.tintColor = UIColor.whiteColor()
        view.addSubview(btnSignin);

        btnLogin = UIButton(type: UIButtonType.System);
        btnLogin.frame = CGRect(x: btnSignin.frame.maxX, y: txtPassword.frame.maxY, width: 100, height: 50);
        btnLogin.setTitle("התחבר", forState: UIControlState.Normal);
        btnLogin.addTarget(self, action: "loginAlert:", forControlEvents: UIControlEvents.TouchUpInside)
        btnLogin.tintColor = UIColor.whiteColor();
        view.addSubview(btnLogin);
    }
    
    //response from server
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        
        var success = false;
        do{
            let responseFromServer = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [NSString : AnyObject];
            success = responseFromServer["success"] as! Bool;
            print(success);
        }catch{
            
        }
        if (success){
            if(tryToConnect){
                presentViewController(messageController, animated: true, completion: nil);
                tryToConnect = false;
            }else{
                print("נרשמת בהצלחה!");
            }
        }else{
            if(tryToConnect){
                 print("התחברות נכשלה, שם משתמש או סיסמא שגויים")
                tryToConnect = false;
            }else{
                print("אחד הפרטים שרשמת שגויים, נסה שנית");
            }
           
            //showAlert("התחברות נכשלה", message: "שם משתמש או סיסמא שגויים");
        }
    }
    func showAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert);
        alertController.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
            
        }))
        presentViewController(alertController, animated: true, completion: nil);
    }

    func loginAlert(sender: UIButton){
        presentViewController(messageController, animated: true, completion: nil);
        if let theUserName = txtUserName.text{
            if let thePassword = txtPassword.text{
                let messageToServer: [NSString : AnyObject] = [
                    "action" : "login",
                    "userName" : theUserName,
                    "password" : thePassword
                ]
                do{
                    tryToConnect = true;
                    let task = try session.uploadTaskWithRequest(request, fromData: NSJSONSerialization.dataWithJSONObject(messageToServer, options: NSJSONWritingOptions.PrettyPrinted));
                    task.resume();
                }catch{
                    
                }
            }
        }
    }
    
    func signinAlert(sender: UIButton){
        let controller = UIAlertController(title: "הרשמה", message: "", preferredStyle: UIAlertControllerStyle.Alert);
        controller.addTextFieldWithConfigurationHandler { (txtUserNameToSignIn: UITextField) -> Void in
            txtUserNameToSignIn.placeholder = "שם משתמש";
            txtUserNameToSignIn.textAlignment = .Right;
        }
        controller.addTextFieldWithConfigurationHandler { (txtPasswordToSignIn: UITextField) -> Void in
            txtPasswordToSignIn.placeholder = "סיסמא";
            txtPasswordToSignIn.textAlignment = .Right;
        }
        controller.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
            if let textFields = controller.textFields{
                if let theUserName = textFields[0].text{
                    if let thePassword = textFields[1].text{
                        let messageToServer: [NSString : AnyObject] = [
                            "action" : "singup",
                            "userName" : theUserName,
                            "password" : thePassword
                        ]
                        do{
                            let task = try self.session.uploadTaskWithRequest(self.request, fromData: NSJSONSerialization.dataWithJSONObject(messageToServer, options: NSJSONWritingOptions.PrettyPrinted));
                            task.resume();
                        }catch{
                            
                        }
                    }
                }
            }
        }));
        controller.addAction(UIAlertAction(title: "ביטול", style: UIAlertActionStyle.Cancel, handler: { (action: UIAlertAction) -> Void in
            
        }));
        presentViewController(controller, animated: true, completion: nil)
    }
}


