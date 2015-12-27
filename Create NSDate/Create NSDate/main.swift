//
//  main.swift
//  Create NSDate
//
//  Created by גיל אושר on 10.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation

enum GregorianEra: Int{
    case BC = 0
    case AD
}
let date = NSCalendar.currentCalendar().dateWithEra(GregorianEra.AD.rawValue, year: 2015, month: 12, day: 10, hour: 14, minute: 03, second: 0, nanosecond: 0)
if let theDate = date{
    print("date = \(date)");
    let components = NSCalendar.currentCalendar().componentsInTimeZone(NSTimeZone(), fromDate: theDate);
    print(components.minute)
    print(components.hour)
    print(components);
}

