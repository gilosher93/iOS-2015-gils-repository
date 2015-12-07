//
//  ViewController.swift
//  Using The Camera
//
//  Created by גיל אושר on 7.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var beenHereBefore = false;
    var controller: UIImagePickerController?;
    var imageView: UIImageView!;
    var contentImageView: UIView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.contentMode = .ScaleAspectFit;
        imageView.center = view.center;
        imageView.image = UIImage(named: "profile");
        imageView.layer.cornerRadius = imageView.frame.size.width/2
        imageView.clipsToBounds = true;
        
        imageView.layer.borderColor = UIColor.grayColor().CGColor
        imageView.layer.borderWidth = 5.0
        view.addSubview(imageView);
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated);
        if beenHereBefore{
            return;
        }
        beenHereBefore = true;
        if isCameraAvailable(){
            controller = UIImagePickerController();
            if let theController = controller{
                theController.sourceType = .Camera;
                theController.mediaTypes = [kUTTypeImage as String];
                theController.delegate = self;
                theController.allowsEditing = true;
                presentViewController(theController, animated: true, completion: nil);
            }
        }
    }
    //check if there is camera
    func isCameraAvailable()->Bool{
        return UIImagePickerController.isSourceTypeAvailable(.Camera);
    }
    
    func cameraSupportsMedia(mediaType: String, sourceType: UIImagePickerControllerSourceType)->Bool{
        let avialableMediaTypes = UIImagePickerController.availableMediaTypesForSourceType(sourceType)!;
        for type in avialableMediaTypes{
            print("type = \(type)")
            if type == mediaType{
                return true;
            }
        }
        return false;
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("picker returned successfully");
        let mediaType: AnyObject? = info[UIImagePickerControllerMediaType];
        if let type: AnyObject = mediaType{
            if type is String{
                let stringType = type as! String;
                if stringType == kUTTypeImage as String{
                    let metadata = info[UIImagePickerControllerMediaMetadata] as? NSDictionary;
                    if let theMetadat = metadata{
                        let image = info[UIImagePickerControllerOriginalImage] as! UIImage;
                        imageView.image = image;
                    }
                }else{
                    //it is video
                }
                
            }
        }
        picker.dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("cancel");
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

