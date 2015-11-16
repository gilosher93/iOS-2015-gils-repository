//
//  ViewController.swift
//  Learning CoreLocation and MapKit
//
//  Created by גיל אושר on 16.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, LocationDelegate, MKMapViewDelegate {

    var mapView: MKMapView!;
    var myAnnotation: MyAnnotation!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: view.bounds);
        mapView.mapType = .Hybrid;
        mapView.delegate = self;
        view.addSubview(mapView)
        addPinToMapView(32.08494427, longitude: 34.800543)
        (UIApplication.sharedApplication().delegate as! AppDelegate).locationDelegate = self;
    }
    
    func locationChanged(latitude: Double, longitude: Double) {
        if myAnnotation != nil{
            mapView.removeAnnotation(myAnnotation);
            addPinToMapView(latitude, longitude: longitude);
        }
    }
    
    func setCenterOfMapToLocation(location: CLLocationCoordinate2D){
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01);
        let region = MKCoordinateRegion(center: location, span: span);
        mapView.setRegion(region, animated: true);
    }
    
    func addPinToMapView(latitude: Double, longitude: Double){
        let location = CLLocationCoordinate2D(latitude: latitude , longitude: longitude);
        myAnnotation = MyAnnotation(coordinate: location, title: "גיל אושר", subTitle: "2 משלוחים פעילים");
        mapView.addAnnotation(myAnnotation);
        setCenterOfMapToLocation(location);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(text: String){
        let alertController = UIAlertController(title: text, message: nil, preferredStyle: UIAlertControllerStyle.Alert);
        alertController.addAction(UIAlertAction(title: "אישור", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction) -> Void in
            
        }))
        presentViewController(alertController, animated: true, completion: nil);
    }


}

