//
//  ViewController.swift
//  Displaying Images with UIImageView
//
//  Created by גיל אושר on 22/10/15.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let image = UIImage(named: "hand");
    var imageView: UIImageView!;
    
    required init?(coder aDecoder: NSCoder){
        //imageView = UIImageView(image: image);
        super.init(coder: aDecoder);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: view.bounds);
        imageView.image = image;
        imageView.contentMode = UIViewContentMode.ScaleAspectFit;
        imageView.center = view.center;
        view.addSubview(imageView);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

