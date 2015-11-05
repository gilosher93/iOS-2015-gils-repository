//
//  ViewController.swift
//  Adding a Dynamic Snap Effect to UI Components
//
//  Created by גיל אושר on 5.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var squareView: UIView?;
    var animator: UIDynamicAnimator?;
    var snapBehavior: UISnapBehavior?;
    
    
    func createGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: "handleTap:");
        view.addGestureRecognizer(tap);
    }
    
    func handleTap(sender: UITapGestureRecognizer){
        /* Get the angle between the center of the square view and the tap point  */
        
        let tapPoint = sender.locationInView(view);
        
        animator?.removeBehavior(snapBehavior!);
        
        snapBehavior = UISnapBehavior(item: squareView!, snapToPoint: tapPoint);
        snapBehavior!.damping = 0.5;
        
        animator!.addBehavior(snapBehavior!);
        
    }
    
    func createSmallSquareView(){
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80));
        if let theSquareView = squareView{
            theSquareView.backgroundColor = UIColor.greenColor();
            theSquareView.center = view.center;
            view.addSubview(theSquareView);
        }
    }
    
    func createAnimatorAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view);
        
        let collision = UICollisionBehavior(items: [squareView!]);
        collision.translatesReferenceBoundsIntoBoundary = true;
        animator!.addBehavior(collision);
        
        snapBehavior = UISnapBehavior(item: squareView!, snapToPoint: squareView!.center);
        snapBehavior!.damping = 0.5;
        
        animator!.addBehavior(snapBehavior!);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        createGestureRecognizer();
        createSmallSquareView();
        createAnimatorAndBehaviors();
    }

}

