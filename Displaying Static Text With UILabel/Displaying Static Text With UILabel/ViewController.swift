//
//  ViewController.swift
//  Displaying Static Text With UILabel
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var label: UILabel!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 20, y: 100, width: 95, height: 70));
        label.numberOfLines = 3;
        label.text = "hello world, how are you today?";
        //label.lineBreakMode = .ByWordWrapping;
        //label.lineBreakMode = .ByClipping; //cut the word if nessecery
        //label.lineBreakMode = .ByTruncatingTail; //cut the end of the label and put 3 point...
        //label.lineBreakMode = .ByTruncatingMiddle
        //label.lineBreakMode = .ByTruncatingHead
        label.adjustsFontSizeToFitWidth = true;
        label.font = UIFont.boldSystemFontOfSize(14);
        view.addSubview(label);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

