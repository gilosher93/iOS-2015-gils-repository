//
//  ViewController.swift
//  Displaying Progress with UIProgressView
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonPlus: UIButton!;
    var buttonMinus: UIButton!;
    var progressView: UIProgressView!;
    var valueInProgressBar: Float = 0.5;
    let changeNumber:Float = 0.02;
    var lblPresentValue: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar);
        progressView.center = view.center;
        progressView.progress = valueInProgressBar;
        progressView.trackTintColor = UIColor.lightGrayColor();
        progressView.tintColor = UIColor.blueColor();
        view.addSubview(progressView);
        
        buttonPlus = UIButton(type: UIButtonType.Custom);
        buttonPlus.frame = CGRect(x: progressView.frame.maxX+10 , y: progressView.frame.origin.y - 10, width: 20, height: 20);
        buttonPlus.addTarget(self, action: "changeProgressBarValue:", forControlEvents: UIControlEvents.TouchDown);
        buttonPlus.setBackgroundImage(UIImage(named: "plus"), forState: UIControlState.Normal)
        view.addSubview(buttonPlus);
        
        buttonMinus = UIButton(type: UIButtonType.Custom);
        buttonMinus.frame = CGRect(x: progressView.frame.origin.x - 30 , y: progressView.frame.origin.y - 10, width: 20, height: 20);
        buttonMinus.addTarget(self, action: "changeProgressBarValue:", forControlEvents: UIControlEvents.TouchDown);
        buttonMinus.setBackgroundImage(UIImage(named: "minus"), forState: UIControlState.Normal)
        view.addSubview(buttonMinus);
        
        lblPresentValue = UILabel(frame: CGRect(x: progressView.frame.width - 10, y: progressView.frame.origin.y - 50, width: 100, height: 50))
        lblPresentValue.text = String(valueInProgressBar);
        view.addSubview(lblPresentValue);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changeProgressBarValue(sender: UIButton){
        if sender == buttonPlus{
            if valueInProgressBar < 1{
                valueInProgressBar += changeNumber;
            }
        }else{
            if valueInProgressBar > 0{
                valueInProgressBar -= changeNumber;
            }
        }
        lblPresentValue.text = String(valueInProgressBar);
        progressView.progress = valueInProgressBar;
    }

}

