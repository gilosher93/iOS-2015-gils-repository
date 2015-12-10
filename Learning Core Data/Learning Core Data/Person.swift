//
//  Person.swift
//  Learning Core Data
//
//  Created by גיל אושר on 10.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation
import CoreData

@objc(Person) class Person: NSManagedObject {
    @NSManaged var age: NSNumber;
    @NSManaged var firstName: String;
    @NSManaged var lastName: String;
}