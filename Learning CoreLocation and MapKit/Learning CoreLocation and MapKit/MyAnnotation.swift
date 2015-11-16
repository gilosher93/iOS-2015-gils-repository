//
//  MyAnnotation.swift
//  Learning CoreLocation and MapKit
//
//  Created by גיל אושר on 16.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0);
    var title: String?;
    var subtitle: String?;
    var pinColor: UIColor!;
    
    init(coordinate: CLLocationCoordinate2D, title: String, subTitle: String, pinColor: UIColor){
        self.coordinate = coordinate;
        self.title = title;
        self.subtitle = subTitle;
        self.pinColor = pinColor;
        super.init();
    }
    
    convenience init(coordinate: CLLocationCoordinate2D, title: String, subTitle: String) {
        self.init(coordinate: coordinate, title: title, subTitle: subTitle, pinColor: UIColor.blueColor());
    }
    
}










