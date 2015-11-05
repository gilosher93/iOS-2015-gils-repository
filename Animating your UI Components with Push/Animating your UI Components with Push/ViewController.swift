//
//  ViewController.swift
//  Animating your UI Components with Push
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView: UIView?;
    var animator: UIDynamicAnimator?;
    var pushBehavior: UIPushBehavior?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSmallSquareView();
        createGestureRecognizer();
        createAnimatorAndBehaviors();
        
    }
    
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80));
        if let theSquareView = squareView{
            theSquareView.backgroundColor = UIColor.greenColor();
            theSquareView.center = view.center;
            view.addSubview(theSquareView);
        }
    }
    
    func createGestureRecognizer(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "handleTap:");
        view.addGestureRecognizer(tapGestureRecognizer);
    }
    
    func handleTap(sender: UITapGestureRecognizer){
        /* get the angel between the center of the squareView and the tap point */
        let tapPoint = sender.locationInView(view);
        let deltaX = tapPoint.x - squareView!.center.x;
        let deltaY = tapPoint.y - squareView!.center.y;
        let angle = atan2(deltaY, deltaX);
        pushBehavior!.angle = angle;
        
        /* use the distance between the tap point and the center of the square view, to calculate the magnitude of the push */
        
        let distanceBetweenPoints = sqrt(deltaX * deltaX + deltaY * deltaY);
        pushBehavior!.magnitude = distanceBetweenPoints / 200;

    }
    
    
    func createAnimatorAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view);
        if let theSquareView = squareView{
            /* Create collision detection (למצוא / לקלוט) */
            let collision = UICollisionBehavior(items: [theSquareView]);
            collision.translatesReferenceBoundsIntoBoundary = true;
            pushBehavior = UIPushBehavior(items: [theSquareView], mode: UIPushBehaviorMode.Continuous);
            animator!.addBehavior(collision);
            animator!.addBehavior(pushBehavior!);
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

