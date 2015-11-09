//
//  ViewController.swift
//  Dispatch After
//
//  Created by גיל אושר on 9.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var x:CGFloat = 15.0;
    var y:CGFloat = 20.0;
    var velocityX:CGFloat = 2.0;
    var velocityY:CGFloat = 3.6;
    var imageView: UIImageView!;
    var go = true;
    var button: UIButton!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: x, y: y, width: 50, height: 50));
        imageView.image = UIImage(named: "ball");
        imageView.center = view.center;
        view.addSubview(imageView);
        button = UIButton(type: UIButtonType.System);
        button.frame = CGRect(x: (view.frame.width-100) / 2, y: view.frame.height-50, width: 100, height: 30);
        button.setTitle("press me!", forState: UIControlState.Normal);
        button.addTarget(self, action: "changeGo:", forControlEvents: UIControlEvents.TouchDown);
        view.addSubview(button);
        
        //let delayInSeconds = 1.0;
        //let delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, Int64(delayInSeconds * Double(NSEC_PER_SEC)))
        
        //let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        print("start");
        doSomething(0.001) { () -> Void in
            dispatch_async(dispatch_get_main_queue(), { [weak self]() -> Void in
                self!.imageView.frame.origin = CGPoint(x: self!.x, y: self!.y);
                self!.x += self!.velocityX;
                self!.y += self!.velocityY;
                if(self!.x + 50 >= self!.view.frame.width || self!.x <= 0){
                    self!.velocityX *= -1;
                }
                if(self!.y + 50 >= self!.view.frame.height || self!.y <= 0){
                    self!.velocityY *= -1;
                }
                
                
                });
        }
        
    }

    
    
    func doSomething(timeToRepit: Double, code: ()->Void){
        let delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, Int64(timeToRepit * Double(NSEC_PER_SEC)));
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_after(delayInNanoSeconds, queue, { [weak self]() -> Void in
            code();
            if(self!.go){
                self!.doSomething(timeToRepit, code: code);
            }
        })
        
    }
    
    func changeGo(sender: UIButton)->Void{
        go = !go;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

