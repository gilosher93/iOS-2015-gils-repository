//
//  ViewController.swift
//  TableView with Refresh Button
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView?;
    var allTimes = [NSDate]();
    var refreshControl: UIRefreshControl?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTimes.append(NSDate());
        
        tableView = UITableView(frame: view.bounds, style: UITableViewStyle.Plain);
        if let theTableView = tableView{
            theTableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "identifier");
            theTableView.dataSource = self;
            theTableView.delegate = self;
            /* Create the refresh control */
            refreshControl = UIRefreshControl();
            refreshControl!.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged);
            theTableView.addSubview(refreshControl!);
            view.addSubview(theTableView);
        }
    }

    func handleRefresh(sender: UIRefreshControl){
        let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)*1);
        dispatch_after(popTime, dispatch_get_main_queue()) { [weak self]() -> Void in
            self!.allTimes.append(NSDate());
            self!.refreshControl!.endRefreshing();
            let indexPathOfNewRow = NSIndexPath(forRow: self!.allTimes.count-1, inSection: 0);
            self!.tableView!.insertRowsAtIndexPaths([indexPathOfNewRow], withRowAnimation: UITableViewRowAnimation.Automatic);
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTimes.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath);
        cell.textLabel?.text = "\(allTimes[indexPath.row])";
        return cell;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

