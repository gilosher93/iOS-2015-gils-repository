//
//  messageController.swift
//  MiniWhatsapp
//
//  Created by גיל אושר on 23.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class MessageController: UIViewController, NSURLSessionDelegate, NSURLSessionDataDelegate, UITableViewDelegate, UITableViewDataSource{
    
    var search: UISearchBar!;
    var btnBack: UIButton!;
    var session: NSURLSession!;
    var btnSend: UIButton!;
    var txtEnterText: UITextField!;
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration();
    var footer: UIView!;
    let url = NSURL(string: "http://10.0.0.194:8080/MainServlet");
    var request: NSMutableURLRequest!;
    var lstMessages: UITableView!;
    var messages: [Message] = [Message]();

    override func viewDidLoad() {
        super.viewDidLoad();
        initializeUI();
        view.backgroundColor = UIColor.whiteColor();
        configuration.timeoutIntervalForRequest = 15.0;
        request = NSMutableURLRequest(URL: url!);
        request.HTTPMethod = "POST";
        session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: nil);
        lstMessages = UITableView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: view.frame.height-50-40), style: UITableViewStyle.Plain);
        lstMessages.delegate = self;
        lstMessages.dataSource = self;
        view.addSubview(lstMessages);
        search = UISearchBar(frame: CGRect(x: 0, y: 40, width: view.frame.width, height: 30))
        search.searchBarStyle = .Minimal;
        view.addSubview(search);
    }
    // how much groups
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //how much rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("identifier");
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "identifier");
        }
        cell!.textLabel?.text = messages[indexPath.row].content;
        cell!.detailTextLabel?.text = messages[indexPath.row].sender;
        return cell!;
    }
    
    func sendMessage(sender: UIButton){
        //blockUI();
        if let theText = txtEnterText.text{
            let messageToServer: [NSString : AnyObject] = [
                "action" : "sendmessage",
                "userName" : "gil",
                "password" : "123",
                "recipient" : "arik",
                "content" : theText
            ]
            do{
                let task = try session.uploadTaskWithRequest(request, fromData: NSJSONSerialization.dataWithJSONObject(messageToServer, options: NSJSONWritingOptions.PrettyPrinted));
                task.resume();
            }catch{
                
            }
        }
        
        txtEnterText.text = "";
    }
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        
    }
    deinit{
        session.finishTasksAndInvalidate();
    }
    
    func blockUI(){
        print("in Block");
        btnSend.tintColor = UIColor.blackColor();
        btnSend.enabled = false;
        footer.backgroundColor = UIColor.grayColor();
    }
    
    func releaseUI(){
        print("in Release")
        btnSend.enabled = true;
        btnSend.tintColor = UIColor.whiteColor();
        footer.backgroundColor = UIColor.blackColor();
    }
    
    func initializeUI(){
        footer = UIView(frame: CGRect(x: 0, y: view.frame.height-50, width: view.frame.width, height: 50));
        footer.backgroundColor = UIColor.blackColor();
        view.addSubview(footer);
        txtEnterText = UITextField(frame: CGRect(x: view.frame.width-260, y: view.frame.height-40, width: 250, height: 30))
        txtEnterText.placeholder = "הקלד הודעה"
        //max length = 22
        txtEnterText.textAlignment = .Right;
        txtEnterText.borderStyle = .RoundedRect;
        
        btnSend = UIButton(type: UIButtonType.System);
        btnSend.frame = CGRect(x: view.frame.width-300, y: view.frame.height-40, width: 100, height: 20);
        btnSend.setTitle("שלח", forState: UIControlState.Normal);
        btnSend.sizeToFit();
        btnSend.addTarget(self, action: "sendMessage:", forControlEvents: UIControlEvents.TouchDown);
        btnSend.tintColor = UIColor.whiteColor()
        
        btnBack = UIButton(type: UIButtonType.Custom);
        btnBack.frame = CGRect(x: 10, y: 20, width: 20, height: 20);
        btnBack.setBackgroundImage(UIImage(named: "back"), forState: UIControlState.Normal);
        btnBack.sizeToFit();
        btnBack.addTarget(self, action: "backToLogInController:", forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(btnBack);
        view.addSubview(btnSend);
        view.addSubview(txtEnterText);
    }
    
    func backToLogInController(sender: UIButton){
        dismissViewControllerAnimated(false, completion: nil);

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

}
