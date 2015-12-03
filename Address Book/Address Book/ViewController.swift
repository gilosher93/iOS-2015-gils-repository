//
//  ViewController.swift
//  Address Book
//
//  Created by גיל אושר on 3.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    var contactPicker: CNContactPickerViewController!;
    var btnShowContacts: UIButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactPicker = CNContactPickerViewController();
        contactPicker.delegate = self;
        
        btnShowContacts = UIButton(type: UIButtonType.System);
        btnShowContacts.frame = CGRect(x: 0, y: 0, width: 100, height: 30);
        btnShowContacts.center = view.center;
        btnShowContacts.frame.origin.y = 50;
        btnShowContacts.setTitle("show contacts", forState: UIControlState.Normal);
        btnShowContacts.addTarget(self, action: "showContacts", forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btnShowContacts);
        
        
    }
    func showContacts(){
        presentViewController(contactPicker, animated: true, completion: nil);
    }
    func contactPicker(picker: CNContactPickerViewController, didSelectContact contact: CNContact) {
        print("chosen contact name: \(contact.givenName)")
        let phoneNumbers = contact.phoneNumbers;
        for phoneNumber in phoneNumbers{
            print((phoneNumber.value as! CNPhoneNumber).stringValue);
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

