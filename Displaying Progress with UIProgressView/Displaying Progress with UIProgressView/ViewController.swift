//
//  ViewController.swift
//  Displaying Progress with UIProgressView
//
//  Created by גיל אושר on 2.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let progressView = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar);
        progressView.center = view.center;
        progressView.progress = 0.5;
        progressView.trackTintColor = UIColor.lightGrayColor();
        progressView.tintColor = UIColor.blueColor();
        view.addSubview(progressView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

