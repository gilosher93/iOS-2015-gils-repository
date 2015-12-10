//
//  ViewController.swift
//  Calendar
//
//  Created by גיל אושר on 10.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askPermissionToCalendar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func askPermissionToCalendar(){
        let eventStore = EKEventStore();
        switch(EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)){
        case .Authorized:
            print("Authorized");
            extractEventEntityOutOfStore(eventStore)
        case .Denied:
            print("Denied");
        case .NotDetermined:
            print("NotDetermined");
            eventStore.requestAccessToEntityType(.Event, completion: { [weak self](granted: Bool, error: NSError?) -> Void in
                if granted{
                    print("granted");
                    self!.extractEventEntityOutOfStore(eventStore)
                }else{
                    print("access denied");
                }
            })
        case .Restricted:
            print("Restricted");
        }
    }
    
    func extractEventEntityOutOfStore(eventStore: EKEventStore){
        let calendars = eventStore.calendarsForEntityType(.Event);
        for calendar in calendars{
            print("title = \(calendar.title)");
            switch calendar.type{
            case .Birthday:
                print("Birthday");
            case .CalDAV:
                print("CalDAV");
            case .Exchange:
                print("Exchange");
            case .Local:
                print("Local");
            case .Subscription:
                print("Subscription");
            }
            print("allows modifications: \(calendar.allowsContentModifications)");
            print("color: \(calendar.CGColor)")
            let color = UIColor(CGColor: calendar.CGColor);
            view.backgroundColor = color;
            print("--------------------------");
        }
    }
}

