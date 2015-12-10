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
    
    var calendar : EKCalendar?;
    var eventStore: EKEventStore?;
    var btn: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        askPermissionToCalendar()
        btn = UIButton(type: UIButtonType.System);
        btn.setTitle("add event", forState: UIControlState.Normal);
        btn.frame = CGRect(x: 0, y: 0, width: 250, height: 30);
        btn.center = view.center;
        btn.addTarget(self, action: "handleBtn", forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btn);
    }
    
    func handleBtn(){
        /*
        if let theCalendar = calendar{
            let startDate = NSDate();
            let endDate = startDate.dateByAddingTimeInterval(24 * 60 * 60);
            createEventWithTitle("gils event", startDate: startDate, endDate: endDate, inCalendar: theCalendar, inEventStore: eventStore!, notes: "important event for gil")
        }*/
        readEvents()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func askPermissionToCalendar(){
        eventStore = EKEventStore();
        switch(EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)){
        case .Authorized:
            print("Authorized");
            extractEventEntityOutOfStore(eventStore!)
        case .Denied:
            print("Denied");
        case .NotDetermined:
            print("NotDetermined");
            eventStore!.requestAccessToEntityType(.Event, completion: { [weak self](granted: Bool, error: NSError?) -> Void in
                if granted{
                    print("granted");
                    self!.extractEventEntityOutOfStore(self!.eventStore!)
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
            if calendar.allowsContentModifications{
                self.calendar = calendar;
            }
            print("allows modifications: \(calendar.allowsContentModifications)");
            print("color: \(calendar.CGColor)")
            let color = UIColor(CGColor: calendar.CGColor);
            view.backgroundColor = color;
            print("--------------------------");
        }
    }
    
    func createEventWithTitle(title: String, startDate: NSDate, endDate: NSDate, inCalendar: EKCalendar, inEventStore: EKEventStore, notes: String)-> Bool{
        
        if !inCalendar.allowsContentModifications{
            print("");
            return false;
        }
        /* create an event */
        let event = EKEvent(eventStore: inEventStore);
        event.calendar = inCalendar;
        
        /* set the properties of the event */
        event.title = title;
        event.notes = notes;
        event.startDate = startDate;
        event.endDate = endDate;
        
        /* save the event into the calendar */
        do{
            try inEventStore.saveEvent(event, span: EKSpan.ThisEvent);
            return true;
        }catch{
            return false;
        }
    }
    
    
    func readEvents(){
        let now = NSDate();
        let startDate = now.dateByAddingTimeInterval(-1 * 60 * 60);
        let endDate = now.dateByAddingTimeInterval(2 * 24 * 60 * 60);
        let searchPredicate = eventStore!.predicateForEventsWithStartDate(startDate, endDate: endDate, calendars: [calendar!]);
        
        let events = eventStore!.eventsMatchingPredicate(searchPredicate);
        
        for event in events{
            print("\(event.title) \(event.startDate) \(event.endDate) \(event.notes)");
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

