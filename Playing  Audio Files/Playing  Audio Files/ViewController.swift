//
//  ViewController.swift
//  Playing  Audio Files
//
//  Created by גיל אושר on 3.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer:  AVAudioPlayer?;
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        print("did finish playing");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue) { [weak self]() -> Void in
            let mainBundle = NSBundle.mainBundle();
            let filePath = mainBundle.pathForResource("locked_away", ofType: "mp3");
            if let thePath = filePath{
                let fileData = NSData(contentsOfFile: thePath);
                do{
                    self!.audioPlayer = try AVAudioPlayer(data: fileData!);
                    self!.audioPlayer!.delegate = self;
                    if self!.audioPlayer!.prepareToPlay() && self!.audioPlayer!.play(){
                        //audio is now playing...
                    }
                }catch{
                    print("error eccured");
                }
            }else{
                print("error finding the file");
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

