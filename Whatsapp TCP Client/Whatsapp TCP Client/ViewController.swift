//
//  ViewController.swift
//  Whatsapp TCP Client
//
//  Created by גיל אושר on 30.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var btnSend: UIButton!;
    var txtMessage: UITextField!;
    var lstMessages: UITableView!;
    var messages: [Message] = [Message]();
    var loggedIn = false;
    var loginAlertController : UIAlertController!;
    var userName:String!;
    var password:String!;
    var tcpClient: TCPclient!;
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        tcpClient = TCPclient();
        btnSend = UIButton(type: UIButtonType.System);
        
        btnSend.frame = CGRect(x: view.frame.width - 80, y: 40, width: 60, height: 30);
        btnSend.setTitle("Send", forState: UIControlState.Normal);
        btnSend.addTarget(self, action: "btnSend:", forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btnSend);
        txtMessage = UITextField(frame: CGRect(x: 10, y: 40, width: view.frame.width - 80 - 10 - 10, height: 30));
        txtMessage.placeholder = "type a message...";
        txtMessage.borderStyle = .RoundedRect;
        txtMessage.delegate = self;
        view.addSubview(txtMessage);
        
        lstMessages = UITableView(frame: CGRect(x: txtMessage.frame.origin.x, y: txtMessage.frame.maxY + 10, width: txtMessage.frame.width + 10 + btnSend.frame.width, height: view.frame.height - txtMessage.frame.maxY - 10 - 10), style: UITableViewStyle.Plain);
        lstMessages.delegate = self;
        lstMessages.dataSource = self;
        view.addSubview(lstMessages);
        
        
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if !loggedIn{
            loginAlertController = UIAlertController(title: "log in", message: "either signup as a new user or log in as an existing user", preferredStyle: UIAlertControllerStyle.Alert);
            loginAlertController.addTextFieldWithConfigurationHandler({ (textField: UITextField) -> Void in
                textField.placeholder = "user name...";
                textField.text = "gil";
            });
            
            loginAlertController.addTextFieldWithConfigurationHandler({ (textField:UITextField) -> Void in
                textField.placeholder = "password...";
                textField.text = "123";
            });
            
            
            let actionSignUP = UIAlertAction(title: "הירשם", style: UIAlertActionStyle.Default, handler: { [weak self](action: UIAlertAction) -> Void in
                self!.userName = self!.loginAlertController.textFields![0].text!;
                self!.password = self!.loginAlertController.textFields![1].text!;
                self!.tcpClient.setUser(self!.userName, andPassword: self!.password);
                self!.tcpClient.signup();
                
                });
            
            let actionLogin = UIAlertAction(title: "התחבר", style: UIAlertActionStyle.Default, handler: { [weak self](action :UIAlertAction) -> Void in
                self!.userName = self!.loginAlertController.textFields![0].text!;
                self!.password = self!.loginAlertController.textFields![1].text!;
                self!.tcpClient.setUser(self!.userName, andPassword: self!.password);
                self!.tcpClient.login();
                });
            
            loginAlertController.addAction(actionSignUP);
            loginAlertController.addAction(actionLogin);
            
            presentViewController(loginAlertController, animated: true, completion: nil);
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("identifier");
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "identifier");
        }
        cell!.textLabel?.text = messages[indexPath.row].content;
        cell!.detailTextLabel?.text = messages[indexPath.row].sender
        return cell!;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    
    func btnSend(sender: UIButton){
        if let theText = txtMessage.text{
            tcpClient.setUser(userName, andPassword: password);
            tcpClient.sendMessage(theText, recipient: "elad");
        }
        txtMessage.text = "";
    }
    
    
    
    
    func checkForMessages(){
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC * 3));
        dispatch_after(time, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { [weak self]() -> Void in
            self!.tcpClient.checkForMessages();
            });
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}