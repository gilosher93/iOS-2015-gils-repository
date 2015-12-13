//
//  ViewController.swift
//  Animating Views
//
//  Created by גיל אושר on 10.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(image: UIImage(named: "profile"));
        imageView.frame = CGRect(x: 0, y: 30, width: 100, height: 100);
        view.addSubview(imageView);
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        
        let endRect = CGRect(x: view.bounds.size.width - 100 , y: view.bounds.size.height - 100, width: 100, height: 100);
        
        UIView.animateWithDuration(2.0, animations: { [weak self]() -> Void in
            self!.imageView.frame = endRect;
            }) { (complete: Bool) -> Void in
                print("finish");
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

