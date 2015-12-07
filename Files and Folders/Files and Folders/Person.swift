//
//  Person.swift
//  Files and Folders
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

@objc(Person) class Person: NSObject, NSCoding {
    var firstName: String;
    var lastName: String;
    
    struct SerializationKey {
        static let firstName = "firstName";
        static let lastName = "lastName";
    }
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName;
        self.lastName = lastName;
        super.init();
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey(SerializationKey.firstName) as! String;
        self.lastName = aDecoder.decodeObjectForKey(SerializationKey.lastName) as! String;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: SerializationKey.firstName);
        aCoder.encodeObject(self.lastName, forKey: SerializationKey.lastName);
    }
}