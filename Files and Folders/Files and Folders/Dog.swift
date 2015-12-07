//
//  Dog.swift
//  Files and Folders
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

@objc(Dog) class Dog: NSObject, NSCoding{
    var color: String;
    var owner: Person;
    
    struct SerializationKey {
        static let color = "color";
        static let owner = "owner";
    }
    
    init(color: String, owner: Person) {
        self.color = color;
        self.owner = owner;
        super.init();
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.color = aDecoder.decodeObjectForKey(SerializationKey.color) as! String;
        self.owner = aDecoder.decodeObjectForKey(SerializationKey.owner) as! Person;
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.color, forKey: SerializationKey.color);
        aCoder.encodeObject(self.owner, forKey: SerializationKey.owner);
    }
    
}