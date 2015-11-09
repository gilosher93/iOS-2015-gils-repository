//
//  ViewController.swift
//  Downloading Image in the Background
//
//  Created by גיל אושר on 9.11.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!;
    var label: UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.center = view.center;
        view.addSubview(imageView);
        imageView.contentMode = .ScaleAspectFill
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(queue) { () -> Void in
            let urlAsString = "http://www.ulscourier.com/images/mail_prohibited.png"
            let url = NSURL(string: urlAsString);
            let urlRequest = NSURLRequest(URL: url!);
            var image: UIImage?;
            do{
                let imageData = try NSURLConnection.sendSynchronousRequest(urlRequest, returningResponse: nil);
                if imageData.length > 0{
                    image = UIImage(data: imageData);
                }
                
            }catch{
                print("error downloading image");
            }
            if let theImage = image{
                dispatch_async(dispatch_get_main_queue(), { [weak self]() -> Void in
                    self!.imageView.image = theImage;
                })
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

