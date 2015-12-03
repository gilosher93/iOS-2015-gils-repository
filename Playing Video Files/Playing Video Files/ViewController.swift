//
//  ViewController.swift
//  Playing Video Files
//
//  Created by גיל אושר on 3.12.2015.
//  Copyright © 2015 gil osher. All rights reserved.
//

import UIKit
import AVKit
import MediaPlayer

class ViewController: UIViewController , AVPlayerViewControllerDelegate{

    var moviePlayer: AVPlayerViewController?;
    var playButton: UIButton!;
    var isPlayingVideo = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton = UIButton(type: UIButtonType.System);
        playButton.setTitle("show and play video", forState: UIControlState.Normal);
        playButton.frame = CGRect(x: 0, y: 0, width: 300, height: 30);
        playButton.center = view.center;
        playButton.frame.origin.y = 50;
        playButton.addTarget(self, action: "handleButton", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(playButton);
    }

    func handleButton(){
        if isPlayingVideo{
            stopPlayingVideo();
            playButton.setTitle("show and play video", forState: UIControlState.Normal);
        }else{
            startPlayingVideo();
            playButton.setTitle("stop and hide video", forState: UIControlState.Normal);
        }
        isPlayingVideo = !isPlayingVideo;
    }
    func startPlayingVideo(){
        moviePlayer = AVPlayerViewController();
        moviePlayer!.delegate = self;
        let url = NSBundle.mainBundle().URLForResource("mVideo", withExtension: "mov");
        moviePlayer!.player = AVPlayer(URL: url!);
        //presentViewController(moviePlayer!, animated: true, completion: nil);
        moviePlayer!.view.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height/2);
        view.addSubview(moviePlayer!.view);
        moviePlayer!.player!.play();
    }
    
    func stopPlayingVideo(){
        if let thePlayer = moviePlayer{
            thePlayer.player!.pause();
            thePlayer.view.removeFromSuperview();
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

